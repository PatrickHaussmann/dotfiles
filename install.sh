#!/bin/bash
set -eu

SCRIPTPATH="$( cd -- "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 ; pwd -P )"

function safe_rm {
  # check if it is a symlink
  if [ -h "$1" ]; then
    rm "$1"
  fi

  # check if it is file or directory
  if [ -f "$1" ] || [ -d "$1" ]; then
    mv "$1" "$1.orig"
  fi
}

function link {
  if [ -f "$1" ] || [ -h "$1" ]; then
	filename=$(basename "$1")
	new_path="$2/$filename"
    safe_rm "$new_path"
    ln -s "$1" "$new_path"
  fi

  if [ -d "$1" ]; then
    folder=$(basename "$1")
    mkdir -p "$2/$folder"
    for subfile in $(ls -A "$1"); do
      new_path="$2/$folder/$subfile"
      safe_rm "$new_path"
      ln -s "$1/$subfile" "$new_path"
    done
  fi
}

files=$( cd "${SCRIPTPATH}" && echo .* vm | fmt -w 1 | grep -vE '^((\.install_did_run)|(\.git)|(\.gitignore)|(\.local)|(\.builds))$' | grep -vE '^[.]{1,2}$' )

for file in $files; do
  link "${SCRIPTPATH}/$file" "${HOME}"
done

#mkdir -p "${SCRIPTPATH}/.local/share/applications"
link "${SCRIPTPATH}/.local/share/applications" "${HOME}/.local/share/"


if [ ! -f "${SCRIPTPATH}/.install_did_run" ]; then

  set +e
  sudo lsof /var/lib/dpkg/lock >/dev/null 2>&1
  [ $? = 0 ] && echo "dpkg/apt lock in use" && exit 1
  set -e

  touch "${SCRIPTPATH}/.install_did_run"
  # Update
  sudo apt-get -qq update && sudo apt-get -qq upgrade && sudo apt-get -qq full-upgrade && sudo apt-get -qq autoremove

  sudo apt-get -qq install curl git htop vim mosh wget bat tmux clang-format python3 xclip
  set +e
  sudo apt-get -qq install exa # not always available
  set -e

  # https://github.com/sharkdp/bat/issues/982#issuecomment-923944239
  sudo dpkg-divert --package batcat --add --rename --divert /usr/bin/bat /usr/bin/batcat
fi

echo "
 _   _      _ _       _
| | | | ___| | | ___ | |
| |_| |/ _ \ | |/ _ \| |
|  _  |  __/ | | (_) |_|
|_| |_|\___|_|_|\___/(_)
"
