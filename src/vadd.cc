#include <cpp-template/vadd.h>

#include <algorithm>
#include <iterator>
#include <type_traits>
#include <vector>

#include "logging.h"

namespace cpp_template {

auto vadd(const std::vector<int>& a, const std::vector<int>& b) -> std::decay_t<decltype(a)> {
  CHECK_EQ(a.size(), b.size());

  std::decay_t<decltype(a)> out;
  std::ranges::transform(a, b, std::back_inserter(out), [](auto a, auto b) { return a + b; });

  return out;
}

}  // namespace cpp_template
