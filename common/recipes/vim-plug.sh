#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_LOCATION}/__installer_template.sh"

executeInstallWithTargetCheck vim-plug .config/nvim/autoload/plug.vim "
\curl --silent -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
command -v nvim > /dev/null && nvim +PlugUpgrade +PlugUpdate +PlugClean +qa
"