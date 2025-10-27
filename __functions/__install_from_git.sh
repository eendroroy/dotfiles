#!/usr/bin/env bash

# Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

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