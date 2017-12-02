#!/usr/bin/env bash

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling vim-plug \033[39m"
if [[ -d ~/.config/nvim/autoload/plug.vim ]]; then
  echo -e "  \033[94m ==> \033[33mvim-plug already installed. Skipping ... \033[39m"
else
  \curl --silent -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  which nvim > /dev/null && nvim +PlugUpgrade +PlugUpdate +PlugClean +qa
fi
