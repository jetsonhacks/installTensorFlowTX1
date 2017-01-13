#!/bin/bash
# NVIDIA Jetson TX1
# TensorFlow Installation
# Build Tensorflow
cd $HOME/tensorflow
bazel build -c opt --local_resources 3072,4.0,1.0 --verbose_failures --explain explain.txt --verbose_explanations --config=cuda //tensorflow/tools/pip_package:build_pip_package

