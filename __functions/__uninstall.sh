#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __remove_path() {
  local path="$1"
  local parent="${path%/*}"

  if [[ -w "${parent}" ]]; then
    ${__DRY} || rm -rf "${path}"
    ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(rm -rf ${path})"
  else
    __m_warning_c "[${parent}] is not writable. using sudo...."
    ${__DRY} || sudo rm -rf "${path}"
    ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(sudo rm -rf ${path})"
  fi
}

function __uninstall() {
  if [[ -f "${__INSTALLATION_CACHE_FILE}" ]]; then
    while IFS= read -r target; do
      [[ -z "${target}" ]] && continue
      __m_warning "Removing: ${target}"
      __remove_path "${target}"
    done < "${__INSTALLATION_CACHE_FILE}"

    __m_warning "Removing installation cache: ${__INSTALLATION_CACHE_FILE}"
    ${__DRY} || rm "${__INSTALLATION_CACHE_FILE}"
    ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(rm ${__INSTALLATION_CACHE_FILE})"
  else
    __m_warning "No installation cache found at: ${__INSTALLATION_CACHE_FILE}"
    __m_warning_c "Nothing to uninstall"
  fi

  if [[ "${__FORCE}" == true ]]; then
    __m_warning "Force mode: scanning for and removing all managed symlink targets..."
    while IFS= read -r -d '' item; do
      local src target
      read -r src target <<< "$(__get_source_target "${item}")"

      if [[ -z "${target}" ]]; then
        continue
      fi

      if [[ -e "${target}" || -L "${target}" ]]; then
        __m_primary "Removing: ${target}"
        __remove_path "${target}"
      else
        [[ "${__VERBOSE}" == true ]] && __m_warning "Not found, skipping: ${target}"
      fi
    done < <(find "${__DOTS_DIR}/" \( -name "*.${__UNAME}.symlink" -o -name "*.generic.symlink" \) -print0 | sort -z)
  fi
}

export -f __uninstall