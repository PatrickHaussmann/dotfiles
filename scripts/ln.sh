#!/bin/bash

# Up from scripts dir
cd ..

function link {
  # check if it is file or directory
  if [ -f ${HOME}/$1 ] || [ -d ${HOME}/$1 ] ; then
    mv ${HOME}/$1 ${HOME}/$1.orig
  fi

  ln -s ${PWD}/$1 ${HOME}
}

link .ssh
link .vim
link .bash_profile
link .bash_unsplash
link .bashrc
link .gitconfig
link .gitmessage
link .tmux.conf
link .vimrc
link .git-completion.bash
