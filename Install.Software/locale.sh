#!/bin/sh

sudo apt-get install -y locales

sudo sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sudo sed -i 's/^# *\(de_DE.UTF-8 UTF-8\)/\1/' /etc/locale.gen

sudo locale-gen

