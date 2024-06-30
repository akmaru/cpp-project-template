#pragma once

#include <vector>

namespace cpp_template {

/**
 * Adds two vectors element-wise.
 *
 * This function takes two vectors `a` and `b` of the same size and returns a new vector
 * containing the element-wise sum of `a` and `b`.
 *
 * @param a The first vector.
 * @param b The second vector.
 * @return The element-wise sum of `a` and `b`.
 */

auto vadd(const std::vector<int>& a, const std::vector<int>& b) -> std::decay_t<decltype(a)>;

}  // namespace cpp_template
