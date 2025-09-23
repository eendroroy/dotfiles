#!/usr/bin/env bash

__install_from_git vim-plug .config/nvim/autoload/plug.vim "
\curl --silent -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
command -v nvim > /dev/null && nvim +PlugUpgrade +PlugUpdate +PlugClean +qa
"