/* * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#pragma once

#include <string>
#include <memory>

namespace influxdb {

    namespace api {

        class line;

        class simple_db {
            struct impl;
            std::unique_ptr<impl> pimpl;

        public:
            simple_db(std::string const& url, std::string const& name, bool deflate = false);
            ~simple_db();

        public:
            void create();
            void drop();
            void insert(line const& lines);
            void with_authentication(std::string const& username, std::string const& password);
            void with_retention_policy(std::string const& retention_policy);
        };
    }

}
