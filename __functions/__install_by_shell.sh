#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# Usage: __install_by_shell <name> <relative-check-path> <shell-command>
# <relative-check-path> is relative to $HOME; used to detect if already installed.
# <shell-command> is eval'd to perform the installation.
function __install_by_shell() {
  local name="$1"
  local check_path="${HOME}/${2}"
  local install_cmd="$3"

  if [[ -e "${check_path}" ]]; then
    [[ "${__VERBOSE}" == true ]] && __warning "Skipping: ${name} already installed at ${check_path}\n"
    return 0
  fi

  __message "Installing ${name}..."
  ${__DRY} || eval "${install_cmd}"
  ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(eval: ${install_cmd})\n"
  __info "${name} installed\n"
}

export -f __install_by_shell