#pragma once

#include <vector>
#include <fmt/ostream.h>

namespace influxdb {
    namespace utility {
        int compress(std::shared_ptr<fmt::MemoryWriter> const &w, std::vector<uint8_t> &compression_buffer);
    }
}


