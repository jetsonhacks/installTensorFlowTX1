#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Patch tensorflow/third_parties/gpu/cuda_configure.bzl
INSTALL_DIR=$PWD
cd $HOME/tensorflow
patch -p1 < $INSTALL_DIR/../patches/cudaConfigureBazel.patch

