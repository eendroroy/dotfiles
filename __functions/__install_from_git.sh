#!/usr/bin/env bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025 Indrajit Roy
# Part of `dotfiles`
# See https://www.fsf.org/licensing/licenses/agpl.html
# OR https://spdx.org/licenses/AGPL-3.0-or-later.html

function __install_from_git() {
  if [[ -e ${HOME}/${2} ]]; then
    ${__VERBOSE} && __m_warning "Skipping : ${1} already installed"
  else
    __m_primary "Installing ${1}..."
    ${__DRY} || mkdir -p "${HOME}/${2}"
    ${__DRY} || git clone "https://github.com/${1}.git" "${HOME}/${2}"
    ${__DRY} && ${__VERBOSE} && __m_success_c "(git clone https://github.com/${1}.git ${HOME}/${2})"
    __m_secondary "${1} installed"
  fi
}

export -f __install_from_git