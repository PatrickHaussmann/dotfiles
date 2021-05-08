# Patrick's dotfiles

This repository consists of my own common dotfiles for a couple of configurations/programs. 

The [installation script included](https://github.com/victoriadrake/dotfiles/blob/ubuntu-20.04/scripts/install.sh) will install a suggested serving of programs and applications, found within the `scripts/` directory. Please verify that you want these before running the script.

Add or delete files in `scripts/install.sh` and `scripts/programs/` to modify the installation.

## Usage

After installing your fresh OS, do:

```sh
sudo apt install -y git
```

Create any SSH keys you need to access GitHub. Then clone this repository:

```sh
git clone git@github.com:patrickhaussmann/dotfiles.git

# Or use HTTPS
git clone https://github.com/patrickhaussmann/dotfiles.git
```

You may optionally like to pass the `--depth` argument to clone only a few of the [most recent commits](https://github.com/patrickhaussmann/dotfiles/commits/master).

Close Firefox if it's open, then run the installation script.

```sh
cd dotfiles/scripts/
./install.sh
```

Uncomment the relevant lines in `.bashrc`, then restart your terminal to see changes, or run:

```sh
cd ~
source .bashrc
```


---

inspired by [victoriadrake](https://github.com/victoriadrake/dotfiles/)
