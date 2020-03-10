#!/usr/bin/env bash

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling spacevim \033[39m"
if [[ -d $HOME/.SpaceVim ]]; then
  echo -e "  \033[94m ==> \033[33mspacevim already installed. Updating... \033[39m"
  curl -sLf https://spacevim.org/install.sh | bash
else
  curl -sLf https://spacevim.org/install.sh | bash
fi
