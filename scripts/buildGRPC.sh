#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Build grpc-java compiler
INSTALL_DIR=$PWD
cd $HOME
git clone https://github.com/grpc/grpc-java.git
cd grpc-java/
git checkout v0.15.0
patch -p0 < $INSTALL_DIR/patches/grpc-java.v0.15.0.patch
CXXFLAGS="-I$(pwd)/../include" LDFLAGS="-L$(pwd)/../lib" ./gradlew java_pluginExecutable -Pprotoc=$(pwd)/../bin/protoc

