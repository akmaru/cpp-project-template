#include <benchmark/benchmark.h>

#include <ranges>

#include "cpp-template/vadd.h"
#include "util.h"

namespace cpp_template {
namespace benchmark {
namespace {

void BM_vadd(::benchmark::State& state) {
  const std::size_t size = state.range(0);
  const auto a = random_vector<int>(size);
  const auto b = random_vector<int>(size);

  for (auto _ : state) {
    const auto out = vadd(a, b);
  }
}

BENCHMARK(BM_vadd)->Range(8, 8 << 10);

}  // namespace
}  // namespace benchmark
}  // namespace cpp_template
