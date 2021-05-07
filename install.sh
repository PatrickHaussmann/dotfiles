# Install stow
apt install -y stow

# From the dotfiles dir
for x in */; do stow $x; done
