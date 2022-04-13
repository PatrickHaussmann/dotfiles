# Patrick's dotfiles

## Install

```sh
git clone https://git.sr.ht/~patrickhaussmann/dotfiles
bash dotfiles/install.sh
```

## Non-root/Fast Install

```sh
git clone https://git.sr.ht/~patrickhaussmann/dotfiles
touch dotfiles/.install_did_run
bash dotfiles/install.sh
```


### Use with Docker

```sh
docker run -it -h dev patrickhaussmann/dev
```


#### Update git remote
```sh
git remote set-url origin git@git.sr.ht:~patrickhaussmann/dotfiles
```
