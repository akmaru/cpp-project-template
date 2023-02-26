include(${PROJECT_SOURCE_DIR}/cmake/module/GoogleBenchmark.cmake)

file(GLOB BENCH_SRCS *.cc)
file(GLOB BENCH_HDRS *.h)
add_executable(cpp-template_benchmark ${BENCH_SRCS} ${BENCH_HDRS})
target_include_directories(cpp-template_benchmark
                           PRIVATE ${PROJECT_INCLUDE_DIRS} ${PROJECT_SRC_DIR})
target_compile_options(cpp-template_benchmark PRIVATE ${PROJECT_CXX_FLAGS})
target_link_libraries(cpp-template_benchmark PRIVATE cpp-template
                                                     benchmark::benchmark)
