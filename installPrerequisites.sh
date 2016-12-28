#!/bin/bash
# NVIDIA Jetson TX1
# Install TensorFlow dependencies and prerequisites
# Install Java and other dependencies by apt-get
./scripts/installDependencies.sh
# Build Protobuf
# Two version are needed. v3.1.0 for grpc-java and v3.0.0-beta2 for Bazel
./scripts/buildProtobuf.sh
# Install grpc-java
# Protobuf v3.1.0 should already have been built and installed before calling this script
./scripts/buildGRPC.sh
# Build Bazel 0.3.2
./scripts/buildBazel.sh


