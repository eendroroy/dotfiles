#!/usr/bin/env bash

rm -rf ~/.dotfiles
git clone https://github.com/eendroroy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles || exit 1
bash install.sh
