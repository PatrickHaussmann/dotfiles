#!/bin/sh

echo "Installing cloudflared"

echo
read -p "Did you copy the tunnel credetials? [Y/n] "  -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo apt-get install ./cloudflared-linux-amd64.deb
rm cloudflared-linux-amd64.deb

cloudflared tunnel login

sudo cloudflared service install

sudo systemctl start cloudflared
sudo systemctl enable cloudflared

