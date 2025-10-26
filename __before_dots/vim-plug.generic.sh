#!/usr/bin/env bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025 Indrajit Roy
# Part of `dotfiles`
# See https://www.fsf.org/licensing/licenses/agpl.html
# OR https://spdx.org/licenses/AGPL-3.0-or-later.html

__install_by_shell vim-plug .config/nvim/autoload/plug.vim "
\curl --silent -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
__m_secondary "Installing neovim plugins via vim-plug"
command -v nvim > /dev/null && nvim +PlugUpgrade +PlugUpdate +PlugClean +qa
"