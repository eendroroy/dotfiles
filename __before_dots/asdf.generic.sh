#!/usr/bin/env bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025 Indrajit Roy
# Part of `dotfiles`
# See https://www.fsf.org/licensing/licenses/agpl.html
# OR https://spdx.org/licenses/AGPL-3.0-or-later.html

__install_from_git asdf-vm/asdf .asdf

if [[ -f "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf" ]]; then
  ${__VERBOSE} && __m_warning "Skipping : asdf completions already exists"
else
  __m_secondary "Installing asdf completions"
  mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
  asd completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
fi