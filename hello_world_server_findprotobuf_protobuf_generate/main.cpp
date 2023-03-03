# include <iostream>

#include "service_impl.h"
#include <grpcpp/grpcpp.h>

int main() {
  std::cout << "Hello World!" << std::endl;

  ServiceImpl service_impl;

  grpc::ServerBuilder builder;
  builder.AddListeningPort("0.0.0.0:50051", grpc::InsecureServerCredentials());

  builder.RegisterService(&service_impl);

  std::unique_ptr<grpc::Server> server(builder.BuildAndStart());
  std::cout << "Server listening on "/* << builder.get_listening_port()*/ << std::endl;

  server->Wait();

  return 0;
}