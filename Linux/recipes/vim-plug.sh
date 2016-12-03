#!/usr/bin/env bash
echo "########## Installing antigen ##########"
if [[ -d ~/.config/nvim/autoload/plug.vim ]]; then
  echo "########## Vim-plug already installed. Skipping ..."
else
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
echo "########################################"
