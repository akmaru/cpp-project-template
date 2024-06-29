cmake_minimum_required(VERSION 3.18.2 FATAL_ERROR)

#
# Project
#
project(
  CppTemplate
  DESCRIPTION "A C++ template project"
  HOMEPAGE_URL "https://github.com/akmaru/cpp-template"
  VERSION 0.1.0
  LANGUAGES CXX C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

#
# Options
#
option(WITH_DOCS "Build documents" OFF)

#
# C/CXX settings
#

# CXX standards
set(CMAKE_CXX_STANDARD 20) # GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compile options
add_compile_options("$<$<CONFIG:RELEASE>:-O3>")
add_compile_options("$<$<CONFIG:RELEASE>:-march=native>")
add_compile_options("$<$<CONFIG:RELEASE>:-mtune=native>")

set(PROJECT_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/include)

#
# Src
#
add_subdirectory(src)

#
# Test
#
enable_testing()
add_subdirectory(test)

#
# Benchmark
#
add_subdirectory(benchmark)

#
# Document
#
if(WITH_DOCS)
  add_subdirectory(docs)
endif()

#
# Installation
#
include(${PROJECT_SOURCE_DIR}/cmake/Installing.cmake)

#
# Packaging
#
include(${PROJECT_SOURCE_DIR}/cmake/Packaging.cmake)
