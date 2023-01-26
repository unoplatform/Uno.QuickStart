FROM gitpod/workspace-dotnet-vnc

USER gitpod
ENV DOTNET_VERSION=7.0.102
ENV DOTNET_ROOT=/workspace/.dotnet
ENV PATH=$DOTNET_ROOT:$PATH
