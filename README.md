# Patrick's dotfiles

This repository consists of my own common dotfiles for a couple of configurations/programs. It is meant to be used in combination with [GNU Stow](https://www.gnu.org/software/stow/) in order to quickly roll some common configurations onto different machines/environments

## Setup

```bash
apt update
apt upgrade -y
apt install stow git
```

In order to pull:
```bash
# From $HOME
git clone --recursive https://github.com/PatrickHaussmann/dotfiles.git
```

To update submodules:
```bash
# From the dotfiles dir
git submodule update --recursive --remote
```

Back up/delete any conflicts, if a system has files in place already.
The stow dry run command will produce errors if files would conflict:

```bash
# From the dotfiles dir
for x in */; do stow -n $x; done
```

Stow makes symlinking everything easy:
```bash
# From the dotfiles dir
for x in */; do stow $x; done
```


To reload any changes to the dotfiles repo 
```bash
# From the dotfiles dir
for x in */; do stow -R $x; done
```

