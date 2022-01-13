#!/bin/sh

# https://github.com/nodesource/distributions/blob/master/README.md#debinstall

echo "Installing nodejs+npm"

sudo apt install -y nodejs npm

yes | sudo npm install -g serve prettier live-server

