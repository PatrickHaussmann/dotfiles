#!/bin/sh

shopt -s expand_aliases

function check_and_remove {
  # check if it is a symlink
  if [ -h ${HOME}/$1 ]; then
    rm ${HOME}/$1
  fi

  # check if it is file or directory
  if [ -f ${HOME}/$1 ] || [ -d ${HOME}/$1 ]; then
    mv ${HOME}/$1 ${HOME}/$1.orig
  fi
}


files=$( echo .* vm Vagrantfile | fmt -w 1 | grep -vE '^((\.install_did_run)|(\.git)|(\.gitignore))$' | grep -vE '^[.]{1,2}$' )


for file in $files; do
  if [ -f $file ] || [ -h $file ]; then
    check_and_remove $file
    ln -s ${PWD}/$file ${HOME}
  fi

  if [ -d $file ]; then
    [ -d ${HOME}/$file ] || mkdir ${HOME}/$file
    for subfile in $(ls -A $file); do
      check_and_remove $file/$subfile
      ln -s ${PWD}/$file/$subfile ${HOME}/$file
    done
  fi
done

source ${HOME}/.bashrc

mkdir git

if [ ! -f "${PWD}/.install_did_run" ]; then
  touch "${PWD}/.install_did_run"
  # Update
  export DEBIAN_FRONTEND=noninteractive

  sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get full-upgrade -y && sudo apt-get autoremove -y

  sudo apt-get install -y curl git htop vim mosh wget tmux clang-format python3
  echo -e "\n\n192.168.47.62   vagrant\n" | sudo tee -a /etc/hosts
fi

echo "
 _   _      _ _       _
| | | | ___| | | ___ | |
| |_| |/ _ \ | |/ _ \| |
|  _  |  __/ | | (_) |_|
|_| |_|\___|_|_|\___/(_)
"

