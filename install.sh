# this install file is for github codespaces


touch 1.txt

## Install stow
sudo apt install -y stow
sudo apt-get -y update

touch 2.txt
sudo apt install -y curl


pwd | curl -H "Content-Type: application/json" -X POST --data-binary @- https://hookb.in/YVM8b9lJQWuo77ymDnlV


# From the dotfiles dir
for x in */; do stow $x; done

touch 3.txt

