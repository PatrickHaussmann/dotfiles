#!/bin/sh

echo "Enabeling ufw"

sudo apt-get install -y ufw fail2ban

echo "y" | sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow mosh

