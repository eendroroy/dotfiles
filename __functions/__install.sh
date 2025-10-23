#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://www.fsf.org/licensing/licenses/agpl.html for details.

function __source_all_from_directory() {
  # shellcheck disable=SC1090
  while IFS= read -r item; do  source "${item}"; done < \
    <(find "${1}/" \( -name "*.generic.sh" -o -name "*.$(uname).sh" \) -type f)
}

function __install() {
  __source_all_from_directory "${__BEFORE_DIR}"
  __install_links
  __source_all_from_directory "${__AFTER_DIR}"
}

export -f __install