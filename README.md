# configs

This is the vimrc and zshrc for my own working environment.

Vim is designed for golang.

## Install

1. Install vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. Install Plugins

Run in vim:

```
:PlugInstall
```

3. Install YCM

```
sudo apt install build-essential cmake python3-dev
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --go-completer
```
