#!/usr/bin/env bash

function __source_all_from_directory() {
  # shellcheck disable=SC1090
  while IFS= read -r item; do  source "${item}"; done < \
    <(find "${SCRIPT_LOCATION}/${1}/" \( -name "*.generic.sh" -o -name "*.$(uname).sh" \) -type f)
}

function __install() {
  rm "${HOME}/.dotfiles_uninstall.txt" 2>/dev/null

  __source_all_from_directory "__before_dots"
  __install_links
  __source_all_from_directory "__dots_after"
}

export -f __install