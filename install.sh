#!/bin/sh

echo "Install YouCompleteMe"
python3 ~/.vim/plugged/YouCompleteMe/install.py --all

echo "Install Tern"
npm install --prefix ~/.vim/plugged/tern_for_vim
