#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://www.fsf.org/licensing/licenses/agpl.html for details.

function __install_links() {
  for type in generic $(uname); do
    while IFS= read -r -d '' item
    do
      read -r source target <<< "$(__get_source_target "${item}" "${type}")"

      if [[ ${target} == "" ]]; then
        continue
      fi

      if [ -e "${target}" ] || [ -L "${target}" ]; then
        ${__VERBOSE} && __m_warning "Skipping : ${target}"
      else
        __m_primary "[${item} -> ${target}]"
        ${__DRY} || mkdir -p "$(dirname "${target}")"
        ${__DRY} || ln -s "${source}" "${target}"
        ${__DRY} && ${__VERBOSE} && __m_success_c "(ln -s ${item} ${target})"
        echo "${target}" >> "${HOME}/.dotfiles_uninstall.txt"
      fi
    done < <(find "${__DOTS_DIR}/" -name "*.${type}.symlink" -print0)
  done
}

export -f __install_links
