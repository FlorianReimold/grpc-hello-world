@echo off


pushd %~dp0

if not exist "_build" mkdir "_build"

pushd %~dp0\_build
cmake .. -A x64^
        -DTHIRDPARTY_BUILD_GRPC=ON^
        -DCMAKE_INSTALL_PREFIX=_install
popd

popd

pause