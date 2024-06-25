#include "cpp-template/vadd.h"

#include <gtest/gtest.h>

#include <cstddef>
#include <ranges>
#include <vector>

namespace cpp_template {
namespace {

TEST(VaddTest, Basic) {
  const std::vector<int> a = {1, 2, 3};
  const std::vector<int> b = {2, 4, 6};
  const auto out = vadd(a, b);

  for (auto i : std::views::iota(static_cast<std::size_t>(0), out.size())) {
    EXPECT_EQ(out[i], a[i] + b[i]);
  }
}

}  // namespace
}  // namespace cpp_template
