#pragma once

#include "hello_world.grpc.pb.h"

class ServiceImpl final : public proto_messages::HelloWorldService::Service {
public:
  grpc::Status SayHello(grpc::ServerContext*                     context,
                        const proto_messages::HelloWorldRequest* request,
                        proto_messages::HelloWorldResponse*      reply) override;
};