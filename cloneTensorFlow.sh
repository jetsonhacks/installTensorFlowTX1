#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Install Tensorflow repository then
# setup for compilation
# This does not build tensorflow
INSTALL_DIR=$PWD
cd $HOME
git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
git checkout r0.11
patch -p1 < $INSTALL_DIR/patches/tensorflow.patch
patch -p1 < $INSTALL_DIR/patches/bazelzlib.patch
patch -p1 < $INSTALL_DIR/patches/cudaConfigureBazel.patch




