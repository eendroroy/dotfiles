#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://www.fsf.org/licensing/licenses/agpl.html for details.

function __uninstall() {
  if [ -f "${HOME}/.dotfiles_uninstall.txt" ]; then
    while IFS= read -r line
    do
      __m_warning "Removing ${line}"
      ${__DRY} || rm "${line}"
      ${__DRY} && ${__VERBOSE} && __m_warning "(rm ${line})"
    done < <(cat "${HOME}/.dotfiles_uninstall.txt")

    ${__DRY} || rm "${HOME}/.dotfiles_uninstall.txt"
    ${__DRY} && ${__VERBOSE} && __m_warning "(rm ${HOME}/.dotfiles_uninstall.txt)"
  else
    ${__VERBOSE} && __m_warning "No uninstall file found at ${HOME}/.dotfiles_uninstall.txt"
    ${__VERBOSE} && __m_warning_c "Nothing to uninstall"
  fi

  ${__FORCE} && for type in generic $(uname); do
    while IFS= read -r -d '' item
    do
      read -r _ target <<< "$(__get_source_target "${item}" "${type}")"

      if [[ ${target} == "" ]]; then
        continue
      fi

      if [ -e "${target}" ] || [ -L "${target}" ]; then
        __m_primary "Removing existing file: ${target}"
        ${__DRY} || rm -rf "${target}"
        ${__DRY} && ${__VERBOSE} && __m_warning "(rm -rf ${target})"
      else
        ${__VERBOSE} && __m_warning "File not found, skipping: ${target}"
      fi
    done < <(find "${__DOTS_DIR}/" -name "*.${type}.symlink" -print0)
  done
}

export -f __uninstall