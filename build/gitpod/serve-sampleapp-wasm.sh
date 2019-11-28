#!/bin/bash

CLI_HOST_PATH=${dirname `ls -rt /workspace/.nuget/uno.wasm.bootstrap.cli/*/dotnet-unowasm.dll | head -1`}

pushd $(CLI_HOST_PATH)

dotnet unowasm serve --urls=http://*:8000 --pathbase /workspace/uno/src/MyApp.Wasm/bin/Debug/netstandard2.0/dist

popd
