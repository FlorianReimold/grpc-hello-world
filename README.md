# grpc-hello-world

## Dependencies

Linux (for using system package grpc):
```
sudo apt install libgrpc-dev libgrpc++-dev protobuf-compiler-grpc
```

## Protobuf_generate:
- From Protobuf-config.cmake: Works, can handle relative paths
- From findProtobuf.cmake (Cmake 3.22 Modul): Relative paths are added to teh output dir
  - => above the project root nothing works anymore
  - Solution: Copy protobuf_generate to eCAL and create a variable USE_ECAL_PROVIDED_PROTOBUF_GENERATE
	- findgRPC.cmake doesn't exist, but we can get it from the googleapis GH repo
