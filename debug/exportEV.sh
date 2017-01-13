#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Export TensorFlow GPU environment variables
export TF_NEED_CUDA=1
export TF_CUDA_VERSION=8.0
export CUDA_TOOLKIT_PATH=/usr/local/cuda
export TF_CUDNN_VERSION=5.1.5
export CUDNN_INSTALL_PATH=/usr/lib/aarch64-linux-gnu/
export TF_CUDA_COMPUTE_CAPABILITIES=5.3

