#!/bin/sh

echo "Installing Jupyter"

sudo apt install python3 python3-pip

pip3 install notebook

pip3 install numpy pandas pytest scikit-learn gradio tensorflow keras scipy plotly seaborn matplotlib

