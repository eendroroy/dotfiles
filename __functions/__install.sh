#!/usr/bin/env bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025 Indrajit Roy
# Part of `dotfiles`
# See https://www.fsf.org/licensing/licenses/agpl.html
# OR https://spdx.org/licenses/AGPL-3.0-or-later.html

function __source_all_from_directory() {
  # shellcheck disable=SC1090
  while IFS= read -r item; do  source "${item}"; done < \
    <(find "${1}/" \( -name "*.generic.sh" -o -name "*.$(uname).sh" \) -type f)
}

function __install() {
  __source_all_from_directory "${__PREINSTALL_DIR}"
  __source_all_from_directory "${__BEFORE_DIR}"
  __install_links
  __source_all_from_directory "${__AFTER_DIR}"
}

export -f __install