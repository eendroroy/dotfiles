#!/usr/bin/env bash

source "${SCRIPT_LOCATION}/scripts/installer_template.sh"

executeInstallWithTargetCheck vim-plug .config/nvim/autoload/plug.vim "
\curl --silent -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
command -v nvim > /dev/null && nvim +PlugUpgrade +PlugUpdate +PlugClean +qa
"