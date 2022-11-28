FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04 

LABEL dev.containers.features="common"

# Change to `amd64` on x86_64 hardware 
RUN curl -Lo /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/v1.15.0/bazelisk-linux-arm64
RUN chmod +x /usr/local/bin/bazel