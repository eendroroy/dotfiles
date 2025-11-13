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
  if command -v -- "${1}" >/dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

function __install_by_apt() {
  local pkg="$1"
  local cmd="$2"

  if __check_command "${pkg}" || { [ -n "${cmd:-}" ] && __check_command "${cmd}"; }; then
    ${__VERBOSE} && __m_warning "Skipping : ${1} already installed"
  else
    __m_primary "Installing ${1}..."
    ${__DRY} || sudo apt install -y "${1}"
    ${__DRY} && ${__VERBOSE} && __m_success_c "(sudo apt install -y ${1})"
    __m_secondary "${1} installed"
  fi
}

export -f __install_by_apt