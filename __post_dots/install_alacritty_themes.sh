#!/usr/bin/env bash

__install_from_git 'alacritty-themes' .config/alacritty/theme/external/am-theme  "
git clone https://github.com/alacritty/alacritty-theme.git ${HOME}/.config/alacritty/theme/external/am-theme --depth=1
"