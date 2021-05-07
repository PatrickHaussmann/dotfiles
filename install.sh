# this install file is for github codespaces


touch 1.txt

## Install stow
apt install -y stow

touch 2.txt

## From the dotfiles dir
for x in */; do stow $x; done

touch 3.txt

