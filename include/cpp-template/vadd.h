#pragma once

#include <vector>

namespace cpp_template {

auto vadd(const std::vector<int>& a, const std::vector<int>& b) -> std::decay_t<decltype(a)>;

}  // namespace cpp_template
