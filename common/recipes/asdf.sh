#!/usr/bin/env bash

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling asdf for zsh \033[39m"
if [[ -d ${HOME}/.asdf ]]; then
  echo -e "  \033[94m ==> \033[33masdf already installed. Skipping... \033[39m"
else
  git clone https://github.com/asdf-vm/asdf.git "${HOME}"/.asdf
fi
