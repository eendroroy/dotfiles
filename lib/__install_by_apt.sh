#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __check_command() {
  command -v -- "${1}" >/dev/null 2>&1
}

# Runs apt-get update once per session (tracked by flag variable)
__APT_UPDATED=false
function __apt_update_once() {
  if [[ "${__APT_UPDATED}" == false ]]; then
    __info "Updating apt package index...\n"
    ${__DRY} || sudo apt-get update -qq
    __APT_UPDATED=true
  fi
}

# Usage: __install_by_apt <package> [command-to-check]
# If [command-to-check] differs from package name (e.g. pkg=fd-find, cmd=fdfind)
function __install_by_apt() {
  local pkg="$1"
  local cmd="${2:-${pkg}}"

  if ! __check_command apt-get 2>/dev/null; then
    __error "apt-get not available; skipping: ${pkg}\n" >&2
    return 1
  fi

  if __check_command "${cmd}"; then
    [[ "${__VERBOSE}" == true ]] && __warning "Skipping: ${pkg} already installed\n"
    return 0
  fi

  __apt_update_once
  __message "Installing ${pkg}...\n"
  ${__DRY} || sudo apt-get install -y "${pkg}"
  ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(sudo apt-get install -y ${pkg})\n"
  __info "${pkg} installed\n"
}

export -f __check_command
export -f __apt_update_once
export -f __install_by_apt