cmake_minimum_required(VERSION 3.22)
project(grpc_hello_world)

# Include findgrpc cmake module
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules/gRPC")

# Include original protobuf-generate.cmake from Google.
# The reason is that the protobuf_generate function from the
# CMake Module is buggy and incompatible with the original
# implementation from protobuf-config.cmake.
# By providing the original implementation, we can support
# both linking against the system package (-> FindProtobuf.cmake)
# and the submodule (-> protobuf-config.cmake)
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/protobuf-generate.cmake")

add_subdirectory(hello_world_server)
add_subdirectory(hello_world_client)