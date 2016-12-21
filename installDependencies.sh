#!/bin/bash
# NVIDIA Jetson TX1
# Install TensorFlow dependencies
# Install Java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
# Install other dependencies
sudo apt-get install git zip unzip autoconf automake libtool curl zlib1g-dev maven -y
sudo apt-get install python-numpy swig python-dev python-pip python-wheel -y
