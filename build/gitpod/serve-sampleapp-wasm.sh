#!/bin/bash
pushd /workspace/Uno.QuickStart/src/MyApp.Wasm/bin/Debug/net5.0/dist

dotnet tool install dotnet-serve -g
export PATH="$PATH:/home/gitpod/.dotnet/tools"

dotnet serve -p 8000

popd

