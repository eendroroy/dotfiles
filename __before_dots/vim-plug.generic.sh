#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://www.fsf.org/licensing/licenses/agpl.html for details.

__install_by_shell vim-plug .config/nvim/autoload/plug.vim "
\curl --silent -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
__m_secondary "Installing neovim plugins via vim-plug"
command -v nvim > /dev/null && nvim +PlugUpgrade +PlugUpdate +PlugClean +qa
"