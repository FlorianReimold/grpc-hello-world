# include <iostream>

#include <grpcpp/grpcpp.h>

#include "hello_world.grpc.pb.h"

int main() {
  std::cout << "Hello World!" << std::endl;

  // GRPC Client for the Hello World Service

  std::shared_ptr<grpc::Channel> channel = grpc::CreateChannel("localhost:50051", grpc::InsecureChannelCredentials());
  proto_messages::HelloWorldService::Stub stub(channel);

  proto_messages::HelloWorldRequest request;
  request.set_name("John");

  proto_messages::HelloWorldResponse reply;
  grpc::ClientContext context;

  grpc::Status status = stub.SayHello(&context, request, &reply);
  if (status.ok()) {
    std::cout << "Greeter received: " << reply.msg() << std::endl;
  } else {
    std::cout << "Greeter received error: " << status.error_code() << ": " << status.error_message() << std::endl;
  }



  return 0;
}