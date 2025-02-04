/* * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#pragma once

#include <cpprest/http_client.h>
#include <fmt/ostream.h>
#include <string>

using utility::string_t;
using web::http::client::http_client;
using web::uri;

namespace influxdb {
    namespace raw {
        class db {
            http_client client;
            uri uri_with_db;

            std::string username;
            std::string password;
            std::string retention_policy;
            bool deflate;

        public:
            db(string_t const& url, string_t const& name, bool deflate = false);

            /// post queries
            void post(string_t const& query);

            /// read queries
            string_t get(string_t const& query);

            /// post measurements
            void insert(std::shared_ptr<fmt::MemoryWriter> const& lines);

            /// post measurements and do not wait
            void insert_async(std::shared_ptr<fmt::MemoryWriter> const& lines);

            /// set username & password for basic authentication
            void with_authentication(std::string const& username, std::string const& password);

            /// set retention policy
            void with_retention_policy(std::string const& retention_policy);
        };
    }
}
