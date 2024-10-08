#!/usr/bin/env bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo
echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling dotfiles \033[39m"

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInitializing submodule(s) \033[39m"

bash "${DOTFILES}/uninstall.sh"
bash "${DOTFILES}/link.sh"
bash "${DOTFILES}/common/recipes/zplug.sh"
bash "${DOTFILES}/common/recipes/hg-color.sh"
bash "${DOTFILES}/common/recipes/vim-plug.sh"
bash "${DOTFILES}/common/recipes/sdkman.sh"
bash "${DOTFILES}/common/recipes/tpm.sh"

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstallation of dotfiles completed. \033[39m"
echo -e "  \033[94m ==> \033[39m"
echo
