#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# Usage: __install_from_git <user/repo> <relative-dest-path>
# Example: __install_from_git zsh-users/zsh-autosuggestions .zsh/zsh-autosuggestions
function __install_from_git() {
  local repo="$1"
  local dest="${HOME}/${2}"
  local parent_dir
  parent_dir="$(dirname "${dest}")"

  if [[ -d "${dest}" ]]; then
    [[ "${__VERBOSE}" == true ]] && __warning "Skipping: ${repo} already installed at ${dest}\n"
    return 0
  fi

  __message "Installing ${repo} -> ${dest}...\n"

  # Ensure parent directory exists (git creates the target dir itself)
  ${__DRY} || mkdir -p "${parent_dir}"
  ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(mkdir -p ${parent_dir})\n"

  ${__DRY} || git clone --depth 1 "https://github.com/${repo}.git" "${dest}"
  ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(git clone --depth 1 https://github.com/${repo}.git ${dest})\n"

  __info "${repo} installed\n"
}

export -f __install_from_git