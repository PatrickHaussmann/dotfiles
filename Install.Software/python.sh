#!/bin/sh

echo "Installing python"

sudo apt-get install -y python3 python3-pip

pip3 install numpy matplotlib scipy
