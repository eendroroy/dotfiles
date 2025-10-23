#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://opensource.org/license/agpl-v3 for details.

__install_from_git asdf-vm/asdf .asdf

if [[ -f "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf" ]]; then
  ${__VERBOSE} && __m_warning "Skipping : asdf completions already exists"
else
  __m_secondary "Installing asdf completions"
  mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
  asd completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
fi