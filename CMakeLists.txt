cmake_minimum_required(VERSION 3.19)
project(grpc_hello_world)

option(THIRDPARTY_BUILD_GRPC "Build gRPC Submodule" OFF)

if (THIRDPARTY_BUILD_GRPC)
    message(STATUS "Building gRPC from submodule")

    # Set gRPC build options
    set(gRPC_BUILD_TESTS OFF CACHE BOOL "Build gRPC tests" FORCE)

    # Build gRPC Submodule
    list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/grpc/cmake/modules")

    # Include gRPC cmake module
    add_subdirectory(thirdparty/grpc EXCLUDE_FROM_ALL)

    list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules/gRPC-submodule")
else()
    # Include findgrpc cmake module
    list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules/gRPC-system")
endif()


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