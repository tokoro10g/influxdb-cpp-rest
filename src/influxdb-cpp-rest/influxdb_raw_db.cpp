// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

#include "influxdb_raw_db.h"
#include "deflate.h"

#include <fmt/ostream.h>
#include <cpprest/streams.h>
#include <cpprest/http_client.h>
#include <cpprest/rawptrstream.h>

using namespace utility;
using namespace web;
using namespace web::http;
using namespace web::http::compression::builtin;

namespace {
    inline void throw_response(http_response const& response) {
#ifndef _MSC_VER
        throw std::runtime_error(response.extract_string().get());
#else
        throw std::runtime_error(conversions::utf16_to_utf8(response.extract_string().get()));
#endif
    }

    inline http_request request_from(
            uri const& uri_with_db,
            std::shared_ptr<fmt::MemoryWriter> lines,
            std::string const& username,
            std::string const& password,
            bool deflate,
            std::string const& retention_policy = "",
            web::http::method const& m = methods::POST
    ) {
        http_request request;

        if (retention_policy.empty())
        {
            request.set_request_uri(uri_with_db);
        }
        else
        {
            uri_builder builder(uri_with_db);
            builder.append_query("rp", retention_policy);
            request.set_request_uri(builder.to_uri());
        }
        request.set_method(m);

        if (!username.empty()) {
            auto auth = username + ":" + password;
            std::vector<unsigned char> bytes(auth.begin(), auth.end());
            request
                .headers()
                .add(
                    header_names::authorization,
                    U("Basic ") +
                    conversions::to_base64(bytes)
                )
            ;
        }

        if (lines->size() > 0 && deflate) {
            std::vector<uint8_t> buffer;
            influxdb::utility::compress(lines, buffer);
            request.headers().add(header_names::content_encoding, algorithm::GZIP);
            request.set_body(concurrency::streams::rawptr_stream<uint8_t>::open_istream(
                                    buffer.data(), buffer.size()));
        } else {
            request.set_body(lines->str());
        }
        
        return request;
    }
}

influxdb::raw::db::db(string_t const & url, string_t const & name, bool deflate)
    :
    client(url), deflate(deflate)
{
    uri_builder builder(client.base_uri());
    builder.append(U("/write"));
    builder.append_query(U("db"), name);
    uri_with_db = builder.to_uri();
}

void influxdb::raw::db::post(string_t const & query)
{
    uri_builder builder(U("/query"));

    builder.append_query(U("q"), query);

    auto w = std::make_shared<fmt::MemoryWriter>();
    // synchronous for now
    auto response = client.request(
        request_from(builder.to_string(), w, username, password, deflate, retention_policy)
    );

    try {
        response.wait();
        if (response.get().status_code() != status_codes::OK) {
            throw_response(response.get());
        }
    } catch (const std::exception& e) {
        throw std::runtime_error(e.what());
    }
}

string_t influxdb::raw::db::get(string_t const & query)
{
    uri_builder builder(U("/query"));

    builder.append_query(U("q"), query);
    auto w = std::make_shared<fmt::MemoryWriter>();

    // synchronous for now
    auto response = client.request(
        request_from(builder.to_string(), w, username, password, deflate, retention_policy)
    );

    try {
        response.wait();
        if (response.get().status_code() == status_codes::OK)
        {
            return response.get().extract_string().get();
        }
        else
        {
            throw_response(response.get());
            return string_t();
        }
    } catch (const std::exception& e) {
        throw std::runtime_error(e.what());
    }
}

void influxdb::raw::db::insert(std::shared_ptr<fmt::MemoryWriter> lines)
{
    auto response = client.request(request_from(uri_with_db, lines, username, password, deflate, retention_policy));

    try {
        response.wait();
        if (!(response.get().status_code() == status_codes::OK || response.get().status_code() == status_codes::NoContent)) {
            throw_response(response.get());
        }
    } catch (const std::exception& e) {
        throw std::runtime_error(e.what());
    }
}

// synchronous for now
void influxdb::raw::db::insert_async(std::shared_ptr<fmt::MemoryWriter> lines)
{
    insert(lines);
}

void influxdb::raw::db::with_authentication(std::string const& username, std::string const& password)
{
    this->username = username;
    this->password = password;
}

void influxdb::raw::db::with_retention_policy(std::string const& retention_policy)
{
    this->retention_policy = retention_policy;
}
