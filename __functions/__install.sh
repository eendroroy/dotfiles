#!/usr/bin/env bash

function __source_all_from_directory() {
  # shellcheck disable=SC1090
  while IFS= read -r item; do  source "${item}"; done < \
    <(find "${1}/" \( -name "*.generic.sh" -o -name "*.$(uname).sh" \) -type f)
}

function __install() {
  rm "${HOME}/.dotfiles_uninstall.txt" 2>/dev/null

  __source_all_from_directory "${__BEFORE_DIR}"
  __install_links
  __source_all_from_directory "${__AFTER_DIR}"
}

export -f __install