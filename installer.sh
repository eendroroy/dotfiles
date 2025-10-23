#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://opensource.org/license/agpl-v3 for details.

[[ -d ~/.dotfiles ]] && echo "Already installed at '~/.dotfiles'" && exit 1
git clone https://github.com/eendroroy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles || exit 1
bash dotfiles -i || exit 1
