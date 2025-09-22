#!/usr/bin/env bash

source "${SCRIPT_LOCATION}/scripts/installer_template.sh"

executeInstallWithTargetCheck 'alacritty-themes' .config/alacritty/theme/external/am-theme  "
git clone https://github.com/zsh-users/antigen.git ${HOME}/.config/alacritty/theme/external/am-theme --depth=1
"