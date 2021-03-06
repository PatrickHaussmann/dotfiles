#!/bin/sh

# Link dotfiles
#bash ./ln.sh

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install curl
install git
install htop
install vim
install mosh
install wget
install tmux
install clang-format
install jq

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

echo "
 _   _      _ _       _ 
| | | | ___| | | ___ | |
| |_| |/ _ \ | |/ _ \| |
|  _  |  __/ | | (_) |_|
|_| |_|\___|_|_|\___/(_)
"

