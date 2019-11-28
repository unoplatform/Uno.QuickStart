#!/bin/bash

pushd src/MyApp.Wasm

export NUGET_PACKAGES=/workspace/.nuget

GITPOD_HOSTNAME=`echo $GITPOD_WORKSPACE_URL | sed -s 's/https:\/\///g'`

msbuild /r /bl MyApp.Wasm.csproj /p:UnoSourceGeneratorUseGenerationHost=true /p:UnoSourceGeneratorUseGenerationController=false /p:UnoRemoteControlPort=443 "/p:UnoRemoteControlHost=53487-$GITPOD_HOSTNAME"

popd
