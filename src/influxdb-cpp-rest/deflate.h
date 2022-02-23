#pragma once

#include <vector>
#include <fmt/ostream.h>

namespace influxdb {
    namespace utility {
        void compress(std::shared_ptr<fmt::MemoryWriter> w, std::vector<uint8_t> &compression_buffer);
    }
}


