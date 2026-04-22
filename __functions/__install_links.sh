#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __install_links() {
  while IFS= read -r -d '' item; do
    local src target target_dir

    read -r src target <<< "$(__get_source_target "${item}")"

    if [[ -z "${target}" ]]; then
      continue
    fi

    # Handle already-existing target
    if [[ -e "${target}" || -L "${target}" ]]; then
      if [[ "${__FORCE}" == true ]]; then
        __m_warning "Force removing existing: ${target}"
        if [[ -w "${target%/*}" ]]; then
          ${__DRY} || rm -rf "${target}"
          ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(rm -rf ${target})"
        else
          __m_warning_c "[${target%/*}] is not writable. using sudo...."
          ${__DRY} || sudo rm -rf "${target}"
          ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(sudo rm -rf ${target})"
        fi
      else
        [[ "${__VERBOSE}" == true ]] && __m_warning "Skipping: ${target}"
        continue
      fi
    fi

    __m_primary "[${src} -> ${target}]"

    target_dir="$(dirname "${target}")"

    if [[ ! -d "${target_dir}" ]]; then
      __m_secondary_c "Creating directory: ${target_dir}"
      if [[ -w "$(dirname "${target_dir}")" ]]; then
        ${__DRY} || mkdir -p "${target_dir}"
        ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(mkdir -p ${target_dir})"
      else
        __m_warning_c "[$(dirname "${target_dir}")] is not writable. using sudo...."
        ${__DRY} || sudo mkdir -p "${target_dir}"
        ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(sudo mkdir -p ${target_dir})"
      fi
    fi

    if [[ -w "${target_dir}" ]]; then
      ${__DRY} || ln -s "${src}" "${target}"
      ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(ln -s ${src} ${target})"
    else
      __m_warning_c "[${target_dir}] is not writable. using sudo...."
      ${__DRY} || sudo ln -s "${src}" "${target}"
      ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_success_c "(sudo ln -s ${src} ${target})"
    fi

    ${__DRY} || echo "${target}" >> "${__INSTALLATION_CACHE_FILE}"
    ${__DRY} && [[ "${__VERBOSE}" == true ]] && __m_secondary_c "(${target} >> ${__INSTALLATION_CACHE_FILE})"

  done < <(find "${__DOTS_DIR}/" \( -name "*.${__UNAME}.symlink" -o -name "*.generic.symlink" \) -print0 | sort -z)
}

export -f __install_links
