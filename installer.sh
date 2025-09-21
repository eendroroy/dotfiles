#!/usr/bin/env bash

[[ -d ~/.dotfiles ]] && echo "Already installed at '~/.dotfiles'" && exit 1
git clone https://github.com/eendroroy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles || exit 1
bash dot_install || exit 1
