#!/usr/bin/env bash

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling tpm \033[39m"
if [ -d ~/.tmux/plugins/tpm ]; then
  echo -e "  \033[94m ==> \033[33mtpm already installed. Skipping... \033[39m"
else
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
