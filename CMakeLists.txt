cmake_minimum_required(VERSION 3.18.2 FATAL_ERROR)

#
# Project
#
project(
  CppTemplate
  VERSION 0.1.0
  LANGUAGES CXX C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE ON)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

#
# C/CXX settings
#

# CXX standards
set(CMAKE_CXX_STANDARD 20) # GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_compile_options("$<$<CONFIG:RELEASE>:-O3>")
add_compile_options("$<$<CONFIG:RELEASE>:-march=native>")
add_compile_options("$<$<CONFIG:RELEASE>:-mtune=native>")

set(PROJECT_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/include)

add_subdirectory(src)

enable_testing()
add_subdirectory(test)

add_subdirectory(benchmark)

# Installation (https://github.com/forexample/package-example) {

# Introduce variables:
#
# * CMAKE_INSTALL_LIBDIR
# * CMAKE_INSTALL_BINDIR
# * CMAKE_INSTALL_INCLUDEDIR
#
include(GNUInstallDirs)

set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
set(version_config "${generated_dir}/${PROJECT_NAME}ConfigVersion.cmake")
set(project_config "${generated_dir}/${PROJECT_NAME}Config.cmake")
set(TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
set(namespace "${PROJECT_NAME}::")

include(CMakePackageConfigHelpers)

# Configure '<PROJECT-NAME>ConfigVersion.cmake'. Use:
#
# * PROJECT_VERSION
#
write_basic_package_version_file(
  "${version_config}"
  COMPATIBILITY SameMajorVersion)

# Configure '<PROJECT-NAME>Config.cmake'. Use variables:
#
# * TARGETS_EXPORT_NAME
# * PROJECT_NAME
#
configure_package_config_file(
  "cmake/template/Config.cmake.in" "${project_config}"
  INSTALL_DESTINATION "${config_install_dir}")

# Targets:
#
# * <prefix>/lib/libCppTemplate.so
# * header location after install: <prefix>/include/a/Bar.hpp
# * headers can be included by C++ code `#include <cpp-template/Bar.hpp>`
#
get_cmake_property(test CPPTEMPLATE_EXPORTS)
install(
  TARGETS ${test}
  EXPORT "${TARGETS_EXPORT_NAME}"
  LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
  ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
  RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
  INCLUDES
  DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

# Headers:
#
# * include/cpp-template -> <prefix>/include/cpp-template
#
install(DIRECTORY include/ DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

# Config * <prefix>/lib/cmake/CppTemplate/CppTemplateConfig.cmake *
# <prefix>/lib/cmake/CppTemplate/CppTemplateConfigVersion.cmake
install(
  FILES "${project_config}" "${version_config}"
  DESTINATION "${config_install_dir}")

# Config:
#
# * <prefix>/lib/cmake/CppTemplate/CppTemplateTargets.cmake
# * build/CppTemplateConfig.cmake
#
install(
  EXPORT "${TARGETS_EXPORT_NAME}"
  NAMESPACE "${namespace}"
  DESTINATION "${config_install_dir}")
export(
  EXPORT "${TARGETS_EXPORT_NAME}"
  NAMESPACE "${namespace}"
  FILE "${PROJECT_NAME}Config.cmake")
