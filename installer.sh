#!/usr/bin/env bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025 Indrajit Roy
# Part of `dotfiles`
# See https://www.fsf.org/licensing/licenses/agpl.html
# OR https://spdx.org/licenses/AGPL-3.0-or-later.html

[[ -d ~/.dotfiles ]] && echo "Already installed at '~/.dotfiles'" && exit 1
git clone https://github.com/eendroroy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles || exit 1
bash dotfiles -i || exit 1
