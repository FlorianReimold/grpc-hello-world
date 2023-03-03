#include "service_impl.h"

grpc::Status ServiceImpl::SayHello(grpc::ServerContext*                     context,
                                  const proto_messages::HelloWorldRequest* request,
                                  proto_messages::HelloWorldResponse*      reply)
{
  reply->set_msg("Hello" + request->name());
  return grpc::Status::OK;
}