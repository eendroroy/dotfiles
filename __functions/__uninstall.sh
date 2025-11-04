#!/usr/bin/env bash

# Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __uninstall() {
  if [ -f "${__INSTALLATION_CACHE_FILE}" ]; then
    while IFS= read -r target
    do
      __m_warning "Removing ${target}"

      if [[ -w "${target}" && -w "${target%/*}" ]]; then
        ${__DRY} || rm "${target}"
        ${__DRY} && ${__VERBOSE} && __m_success_c "(rm ${target})"
      else
        __m_warning_c "[$(dirname "${target}")] is not writable. using sudo...."
        ${__DRY} || sudo rm "${target}"
        ${__DRY} && ${__VERBOSE} && __m_success_c "(sudo rm ${target})"
      fi
    done < <(cat "${__INSTALLATION_CACHE_FILE}")

    __m_warning "Removing installation cache ${__INSTALLATION_CACHE_FILE}"
    ${__DRY} || rm "${__INSTALLATION_CACHE_FILE}"
    ${__DRY} && ${__VERBOSE} && __m_success_c "(rm ${__INSTALLATION_CACHE_FILE})"
  else
    ${__VERBOSE} && __m_warning "No uninstall file found at ${__INSTALLATION_CACHE_FILE}"
    ${__VERBOSE} && __m_warning_c "Nothing to uninstall"
  fi

  ${__FORCE} && while IFS= read -r -d '' item
  do
    read -r _ target <<< "$(__get_source_target "${item}")"

    if [[ ${target} == "" ]]; then
      continue
    fi

    if [ -e "${target}" ] || [ -L "${target}" ]; then
      __m_primary "Removing existing file: ${target}"

      if [[ -w "${target}" && -w "${target%/*}" ]]; then
        ${__DRY} || rm -rf "${target}"
        ${__DRY} && ${__VERBOSE} && __m_success_c "(rm -rf ${target})"
      else
        __m_warning_c "[${target}] is not writable. using sudo...."
        ${__DRY} || sudo rm -rf "${target}"
        ${__DRY} && ${__VERBOSE} && __m_success_c "(sudo rm -rf ${target})"
      fi
    else
      ${__VERBOSE} && __m_warning "File not found, skipping: ${target}"
    fi
  done < <(find "${__DOTS_DIR}/" \( -name "*.${__UNAME}.symlink" -o -name "*.generic.symlink" \) -print0)
}

export -f __uninstall