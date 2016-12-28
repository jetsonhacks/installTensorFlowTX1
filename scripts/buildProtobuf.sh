#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Build Protobuf

# For grpc-java build
cd $HOME
git clone https://github.com/google/protobuf.git
cd protobuf
git checkout v3.1.0
./autogen.sh
LDFLAGS=-static ./configure --prefix=$(pwd)/../
sed -i -e 's/LDFLAGS = -static/LDFLAGS = -all-static/' ./src/Makefile
make -j 4
sudo make install

# For bazel build
git checkout v3.0.0-beta-2
./autogen.sh
LDFLAGS=-static ./configure --prefix=$(pwd)/../
sed -i -e 's/LDFLAGS = -static/LDFLAGS = -all-static/' ./src/Makefile
make -j 4

