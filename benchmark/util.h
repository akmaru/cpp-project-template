#pragma once

#include <cstddef>
#include <cstdlib>
#include <vector>

namespace cpp_template {
namespace benchmark {

template <typename T>
std::vector<T> random_vector(std::size_t size) {
  std::vector<T> out(size);

  for (auto& v : out) {
    v = rand();
  }

  return out;
}

}  // namespace benchmark
}  // namespace cpp_template
