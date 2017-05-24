#!/usr/bin/env bash
echo "########## Installing antigen ##########"
if [[ -d ~/.config/nvim/autoload/plug.vim ]]; then
  echo "########## Vim-plug already installed. Skipping ..."
else
  echo "########## Installing vim-plug ..."
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  which nvim > /dev/null && nvim +PlugUpgrade +PlugUpdate +PlugClean +qa
fi
echo "########################################"
