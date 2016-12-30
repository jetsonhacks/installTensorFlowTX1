# installTensorFlowTX1
December 28, 2016

Install TensorFlow r0.11 on NVIDIA Jetson TX1 Development Kit

Jetson TX1 is flashed with JetPack 2.3.1 which installs:
* L4T 24.2.1 an Ubuntu 16.04 64-bit variant (aarch64)
* CUDA 8.0
* cuDNN 5.1.5

### Installation
Before installing TensorFlow, a swap file should be created (minimum of 8GB recommended). The Jetson TX1 does not have enough physical memory to compile TensorFlow. Also, if TensorFlow is being compiled on the built-in 16GB flash drive, a standard JetPack installation may consume too much room on the drive to successfully build TensorFlow. Extraneous files will need to be removed. Eliminating the .deb files in the home directory appears to be enough to allow TensorFlow to build. Successful builds tend to have more than 5.5GB free. Also, for a successful build it is recommended to set local lib using the included script setLocalLib.sh, as grpc-java in particular seems to run into issues if it /usr/local/lib is not in the path.

Note: Most of this procedure was derived from the thread: https://github.com/tensorflow/tensorflow/issues/851

TensorFlow should be built in the following order:

#### installPrerequisites.sh
Installs Java and other dependencies needed. Also builds:

##### Protobuf
Two versions of protobuf are compiled. The first (v3.1.0) is needed to build grpc-java. This version ends up being installed in $HOME/lib and $HOME/bin. The second version (v3.0.0-beta-2) is used to build bazel

##### grpc-java
grpc-java v0.15.0 requires > v3.0.0-beta-3 of protobuf. A patch is applied for aarch64.

##### Bazel
Builds version 0.3.2. Includes patches for compiling under aarch64.

#### cloneTensorFlow.sh
Git clones r0.11 from the TensorFlow repository and patches the source code for aarch64

#### setTensorFlowEV.sh
Sets up the TensorFlow environment variables. This script will ask for the default python library path.

#### buildTensorFlow.sh
Builds TensorFlow.

#### packageTensorFlow.sh
Once TensorFlow has finished building, this script may be used to create a 'wheel' file, a package for installing with Python. The wheel file will be in the $HOME directory, tensorflow-0.11.0-py2-none-any.whl

#### Install wheel file
$ pip install $HOME/tensorflow-0.11.0-py2-none-any.whl

#### Test
Run a simple TensorFlow example for the initial sanity check:

$ cd $HOME/tensorflow

$ time python tensorflow/models/image/mnist/convolutional.py 

