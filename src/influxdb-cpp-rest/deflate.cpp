#include <cpprest/http_client.h>
#include <cpprest/json.h>
#include <cpprest/rawptrstream.h>
#include <fmt/ostream.h>
#include <rx.hpp>
#include <atomic>
#include <chrono>

using namespace web::http::client;
using namespace web::http;
using namespace utility;
using namespace web::http::compression::builtin;

namespace influxdb {
    namespace utility {
        int compress(std::shared_ptr<fmt::MemoryWriter> const& w, std::vector<uint8_t> &compression_buffer) {
            auto c = make_compressor(algorithm::GZIP);
            const int rawdata_size = w->size();
            const uint8_t* rawdata_ptr =
                reinterpret_cast<const uint8_t*>(w->data());
            int rawdata_cursor = 0;

            int compressed_size = 0;
            bool done = false;

            compression_buffer.resize(rawdata_size);
            while (!done)
            {
                size_t used = 0;
                if (compressed_size >= rawdata_size * 16)
                {
                    throw std::runtime_error(
                        "gzip data is 16 times larger than raw data. abort "
                        "compression");
                }
                if (compressed_size == compression_buffer.size())
                {
                    compression_buffer.resize(compressed_size * 2);
                }
                const int got = c->compress(
                    rawdata_ptr + rawdata_cursor,   // rawdata ptr
                    rawdata_size - rawdata_cursor,  // remaining rawdata size
                    compression_buffer.data() +
                        compressed_size,  // buffer ptr to append
                    compression_buffer.size() -
                        compressed_size,  // buffer available size
                    web::http::compression::operation_hint::is_last, used, done);
                compressed_size += got;
                rawdata_cursor += used;
            }
            compression_buffer.resize(compressed_size);
            return compressed_size;
        }
    }
}
