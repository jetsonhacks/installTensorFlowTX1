#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Build Tensorflow
# Export TensorFlow GPU environment variables
# WARNING This needs to match setTensorFlowEV.sh settings
export TF_NEED_CUDA=1
export TF_CUDA_VERSION=8.0
export CUDA_TOOLKIT_PATH=/usr/local/cuda
export TF_CUDNN_VERSION=5.1.5
export CUDNN_INSTALL_PATH=/usr/lib/aarch64-linux-gnu/
export TF_CUDA_COMPUTE_CAPABILITIES=5.3

cd $HOME/tensorflow
bazel build -c opt --local_resources 3072,4.0,1.0 --verbose_failures --explain explain.txt --verbose_explanations --config=cuda //tensorflow/tools/pip_package:build_pip_package

