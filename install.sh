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


files=$(echo .* | fmt -w 1 | sed '/^\.$/d' | sed '/^\.\.$/d' | sed '/^\.git$/d' | sed '/^\.gitignore$/d' )


for file in $files; do
  if [ -f $file ]; then
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


# Update
sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y

sudo apt install -y curl git htop vim mosh wget tmux clang-format


echo "
 _   _      _ _       _ 
| | | | ___| | | ___ | |
| |_| |/ _ \ | |/ _ \| |
|  _  |  __/ | | (_) |_|
|_| |_|\___|_|_|\___/(_)
"

