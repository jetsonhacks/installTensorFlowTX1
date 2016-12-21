#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Build Bazel
INSTALL_DIR=$PWD
cd $HOME
git clone https://github.com/bazelbuild/bazel.git
cd bazel
git checkout 0.3.2
cp ../protobuf/src/protoc third_party/protobuf/protoc-linux-arm32.exe
cp ../grpc-java/compiler/build/exe/java_plugin/protoc-gen-grpc-java third_party/grpc/protoc-gen-grpc-java-0.15.0-linux-arm32.exe
patch -p1 < $INSTALL_DIR/patches/bazel.patch
./compile.sh 
