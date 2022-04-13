#!/bin/sh

echo "Installing nodejs+npm"


curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs

yes | sudo npm install -g serve prettier live-server

