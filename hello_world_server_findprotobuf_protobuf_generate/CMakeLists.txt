set(CMAKE_VERBOSE_MAKEFILE on)
project(hello_world_server)

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG OFF)

find_package(Threads REQUIRED)
find_package(Protobuf REQUIRED)
find_package(gRPC REQUIRED)

set(source_files
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/service_impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/service_impl.h
)

set (proto_files
    proto/hello_world.proto
)

include_directories(${CMAKE_CURRENT_BINARY_DIR}/proto)
include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_executable(${PROJECT_NAME}
    ${source_files}
    ${proto_files}
)

target_link_libraries(${PROJECT_NAME}
    protobuf::libprotobuf
    Threads::Threads
    gRPC::grpc++
)

protobuf_generate(
  TARGET
    ${PROJECT_NAME}
  LANGUAGE
    cpp
  PROTOC_OUT_DIR
    ${CMAKE_CURRENT_BINARY_DIR}/
  IMPORT_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}/proto
)

protobuf_generate(
  TARGET
    ${PROJECT_NAME}
  LANGUAGE
    grpc
  PLUGIN
    "protoc-gen-grpc=\$<TARGET_FILE:gRPC::grpc_cpp_plugin>"
  GENERATE_EXTENSIONS
    .grpc.pb.h .grpc.pb.cc
  IMPORT_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}/proto
  PROTOC_OUT_DIR
    ${CMAKE_CURRENT_BINARY_DIR}/
)