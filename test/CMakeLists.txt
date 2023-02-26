include(${PROJECT_SOURCE_DIR}/cmake/module/GoogleTest.cmake)

file(GLOB TEST_SRCS *.cc)

foreach(test_path ${TEST_SRCS})
  get_filename_component(test_file ${test_path} NAME)
  string(REPLACE ".cc" "" test_name ${test_file})
  add_executable(${test_name} ${test_file})
  target_include_directories(${test_name} PRIVATE ${PROJECT_INCLUDE_DIRS}
                                                  ${PROJECT_SRC_DIR})
  target_compile_options(${test_name} PRIVATE ${PROJECT_CXX_FLAGS})
  target_link_libraries(${test_name} PRIVATE cpp-template GTest::gtest_main)
  gtest_discover_tests(${test_name})
endforeach()
