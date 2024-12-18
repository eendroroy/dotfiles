#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "${SCRIPT_LOCATION}/util/style.sh"

echo
echo -e "$(printPrimaryMessage "Installing dotfiles")"
echo -e "$(printPrimaryMessage "Initializing submodule(s)")"

bash "${SCRIPT_LOCATION}/link.sh"
bash "${SCRIPT_LOCATION}/common/recipes/asdf.sh"
bash "${SCRIPT_LOCATION}/common/recipes/zplug.sh"
bash "${SCRIPT_LOCATION}/common/recipes/vim-plug.sh"
bash "${SCRIPT_LOCATION}/common/recipes/sdkman.sh"
bash "${SCRIPT_LOCATION}/common/recipes/tpm.sh"

echo -e "$(printPrimaryMessage "Installation of dotfiles completed")"
echo
