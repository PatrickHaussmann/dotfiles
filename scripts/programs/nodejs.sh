#!/bin/sh

# https://github.com/nodesource/distributions/blob/master/README.md#debinstall

echo "Installing nodejs+npm"

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

yes | sudo npm install -g serve vercel prettier

