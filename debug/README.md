If you're looking at this document, something has probably gone wrong with the TensorFlow build. This assumes that the script 'buildTensorFlow.sh' failed to finish properly.

Here's a couple of tips:

STEP 1

First, as of this writing (Jan 12, 2017) running buildTensorFlow.sh a second time causes an error stating that the GPU processing is not enabled, though the CUDA flag is true in the bazel build line. This is due to an issue in the file:

tensorflow/third_party/gpus/cuda_configure.bzl

Where the rule:

cuda_configure = repository_rule(
    implementation = _cuda_autoconf_impl,
    local = True,
)

forces Bazel to always rebuild the CUDA configuration, which in turn foobars the incremental build. In order to fix that, run the patch:

$ ./patchCUDAConfig.sh

If you attempted to run buildTensorFlow.sh before patching, you will need to replace the folder local_config_cuda in the folder:

/home/ubuntu/.cache/bazel/_bazel_ubuntu/<id>/external

with the one in this directory. Ideally, you would save the folder after it is generated, and before it gets overwritten. Note: This may work, or it may not. There is a 'bin' directory which has symbolic pointers which may not match your system. If that is the case, you will have to run 'setTensorFlowEV.sh' and 'buildTensorFlow.sh' again and rebuild everything.

STEP 2

$ ./exportEV.sh

Which exports the needed TF CUDA Environment variables

STEP 3

$ ./buildTensorFlow.sh

This is a more verbose version of the original buildTensorFlow.sh in the parent directory. A file named 'explain.txt' is generated in the $HOME/tensorflow directory.

This should allow for incremental compilation at least, and show you where the build is failing.




