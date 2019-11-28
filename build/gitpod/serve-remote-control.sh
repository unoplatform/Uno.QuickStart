#!/bin/bash
RC_HOST_PATH=${dirname `ls -rt /workspace/.nuget/uno.ui.remotecontrol/*/tools/rc/host/*Host.dll | head -1`}

pushd $RC_HOST_PATH

dotnet run --httpPort 53487

popd
