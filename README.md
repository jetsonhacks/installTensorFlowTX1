# installTensorFlowTX1
December 20, 2016

Still under construction

Install TensorFlow r0.11 on NVIDIA Jetson TX1 Development Kit

Jetson TX1 is flashed with JetPack 2.3.1 which installs:
* L4T 24.2.1 an Ubuntu 16.04 64-bit variant (aarch64)
* CUDA 8.0
* cuDNN 5.1

### Installation
Before installing TensorFlow, a swap file should be created (minimum of 8GB recommended). The Jetson TX1 does not have enough physical memory to compile TensorFlow. Also, if TensorFlow is being compiled on the built-in 16GB flash drive, a standard JetPack installation may consume too much room on the drive. Extraneous files will have to be removed. Eliminating the .deb file in the home directory appears to be enough to allow TensorFlow to build.

Note: Most of this procedure was derived from the thread: https://github.com/tensorflow/tensorflow/issues/851

TensorFlow is built in the following order:

#### installDependencies.sh
Installs Java and other dependencies needed.

#### buildProtobuf.sh
Two versions of protobuf are compiled. The first (v3.0.0-beta-3) is needed to build grpc-java. This version ends up being installed in $HOME/lib and $HOME/bin. The second version (v3.0.0-beta-2) is used to build bazel

#### buildGRPC.sh
grpc-java v0.15.0 requires v3.0.0-beta-3 of protobuf. A patch is applied for aarch64.

#### buildBazel.sh
Builds version 0.3.2. Includes patches for compiling under aarch64.

#### installTensorFlow.sh
Git clones r0.11 from the TensorFlow repository and patches the source code for aarch64

#### setTensorFlowEV.sh
Sets up the TensorFlow environment variables. This script will ask for the default python library path.

#### buildTensorFlow.sh
Builds TensorFlow. Due to what appears to be memory pressure, sometimes this build script needs to be run more than once on failure.
