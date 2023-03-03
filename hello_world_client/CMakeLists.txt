project(hello_world_client)

find_package(Threads REQUIRED)
find_package(Protobuf REQUIRED)
find_package(gRPC REQUIRED)

set(source_files
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

set (proto_files
    ../proto/hello_world.proto
)
set (proto_root_dir ${CMAKE_CURRENT_SOURCE_DIR}/../proto)
set (proto_out_dir  ${CMAKE_CURRENT_BINARY_DIR}/)

include_directories(${proto_out_dir})

add_executable(${PROJECT_NAME}
    ${source_files}
    ${proto_files}
)

target_link_libraries(${PROJECT_NAME}
    protobuf::libprotobuf
    Threads::Threads
    gRPC::grpc++
)

protobuf_generate_original(
  TARGET
    ${PROJECT_NAME}
  LANGUAGE
    cpp
  PROTOC_OUT_DIR
    ${proto_out_dir}/
  IMPORT_DIRS
    ${proto_root_dir}
)

protobuf_generate_original(
  TARGET
    ${PROJECT_NAME}
  LANGUAGE
    grpc
  PLUGIN
    "protoc-gen-grpc=\$<TARGET_FILE:gRPC::grpc_cpp_plugin>"
  GENERATE_EXTENSIONS
    .grpc.pb.h .grpc.pb.cc
  IMPORT_DIRS
    ${proto_root_dir}
  PROTOC_OUT_DIR
    ${proto_out_dir}
)