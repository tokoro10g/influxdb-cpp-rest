/* * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#pragma once

#include <memory>
#include <string>

#include "influxdb_simple_async_api.h"

namespace influxdb
{
namespace api
{
class line;
}
}  // namespace influxdb

namespace influxdb2
{
namespace async_api
{
class simple_db : public influxdb::async_api::simple_db
{
  struct impl;
  std::unique_ptr<impl> pimpl;

 public:
  simple_db(std::string const& url, std::string const& org, std::string const& bucket);
  simple_db(std::string const& url, std::string const& org, std::string const& bucket,
            const int duration_seconds, const int shard_duration_seconds,
            const int window_max_lines, const int window_max_ms);
  ~simple_db();

 public:
  void create();
  void insert(influxdb::api::line const& lines);
};
}  // namespace async_api

}  // namespace influxdb2
