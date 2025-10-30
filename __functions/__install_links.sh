#!/usr/bin/env bash

# Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __install_links() {
  for type in generic "${__UNAME}"; do
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

        target_dir="$(dirname "${target}")"
        if [[ -w "${target_dir}" ]]; then
          ${__DRY} || mkdir -p "${target_dir}"
          ${__DRY} || ln -s "${source}" "${target}"
          ${__DRY} && ${__VERBOSE} && __m_success_c "(ln -s ${item} ${target})"
        else
          __m_warning_c "[${target_dir}] is not writable. using sudo...."
          ${__DRY} || sudo mkdir -p "${target_dir}"
          ${__DRY} || sudo ln -s "${source}" "${target}"
          ${__DRY} && ${__VERBOSE} && __m_success_c "(sudo ln -s ${item} ${target})"
        fi

        ${__DRY} || echo "${target}" >> "${__INSTALLATION_CACHE_FILE}"
        ${__DRY} && ${__VERBOSE} && __m_secondary_c "(${target} >> ${__INSTALLATION_CACHE_FILE})"
      fi
    done < <(find "${__DOTS_DIR}/" -name "*.${type}.symlink" -print0)
  done
}

export -f __install_links
