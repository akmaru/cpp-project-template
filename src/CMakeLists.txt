file(GLOB SRC_HDRS *.h)
file(GLOB SRC_SRCS *.cc)

add_library(
    cpp-template SHARED
    ${SRC_SRCS}
    ${SRC_HDRS}
)

target_include_directories(
    cpp-template
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
    PUBLIC 
    $<BUILD_INTERFACE:${PROJECT_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

set_property(GLOBAL APPEND PROPERTY CPPTEMPLATE_EXPORTS cpp-template)
