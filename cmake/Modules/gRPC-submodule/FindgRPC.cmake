set(_PROTOBUF_LIBPROTOBUF libprotobuf)
set(_REFLECTION grpc++_reflection)
if(CMAKE_CROSSCOMPILING)
    find_program(_PROTOBUF_PROTOC protoc)
else()
    set(_PROTOBUF_PROTOC $<TARGET_FILE:protobuf::protoc>)
endif()
set(_GRPC_GRPCPP grpc++)
if(CMAKE_CROSSCOMPILING)
    find_program(_GRPC_CPP_PLUGIN_EXECUTABLE grpc_cpp_plugin)
else()
    set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:grpc_cpp_plugin>)
endif()

# add alias targets for all gRPC targets
foreach(_target
        grpc
        grpc++
        # grpc++_alts
        # grpc++_error_details
        # grpc++_reflection
        # grpc++_unsecure
        # grpc++_codegen
        # grpc_cpp_plugin
        # grpc_csharp_plugin
        # grpc_node_plugin
        # grpc_objective_c_plugin
        # grpc_php_plugin
        # grpc_python_plugin
        # grpc_ruby_plugin
        # grpc_unsecure
        )
    if (NOT TARGET gRPC::${_target})
        add_library(gRPC::${_target} ALIAS ${_target})
    endif()
endforeach()

foreach(_target
        # grpc
        # grpc++
        # grpc++_alts
        # grpc++_error_details
        # grpc++_reflection
        # grpc++_unsecure
        # grpc++_codegen
        grpc_cpp_plugin
        # grpc_csharp_plugin
        # grpc_node_plugin
        # grpc_objective_c_plugin
        # grpc_php_plugin
        # grpc_python_plugin
        # grpc_ruby_plugin
        # grpc_unsecure
        )
    if (NOT TARGET gRPC::${_target})
        add_executable(gRPC::${_target} ALIAS ${_target})
    endif()
endforeach()

set(gRPC_FOUND TRUE)