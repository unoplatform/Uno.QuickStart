#!/bin/bash
LATEST_RC=`ls -rt /workspace/.nuget/uno.ui.remotecontrol/*/tools/rc/host/*Host.dll | head -1`
RC_HOST_PATH=`dirname $LATEST_RC`

pushd $RC_HOST_PATH

dotnet Uno.UI.RemoteControl.Host.dll --httpPort 53487

popd
