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
        __warning "Force removing existing: ${target}\n"
        if [[ -w "${target%/*}" ]]; then
          ${__DRY} || rm -rf "${target}"
          ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(rm -rf ${target})\n"
        else
          __warning "[${target%/*}] is not writable. using sudo....\n"
          ${__DRY} || sudo rm -rf "${target}"
          ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(sudo rm -rf ${target})\n"
        fi
      else
        [[ "${__VERBOSE}" == true ]] && __warning "Skipping: ${target}\n"
        continue
      fi
    fi

    __lnk "${target#"${HOME}"/} ${DIM_RED}<-${RESET} ${DIM_GREEN}${src#"${SCRIPT_LOCATION}"/}${RESET}\n"

    target_dir="$(dirname "${target}")"

    if [[ ! -d "${target_dir}" ]]; then
      __info "Creating directory: ${target_dir}\n"
      if [[ -w "$(dirname "${target_dir}")" ]]; then
        ${__DRY} || mkdir -p "${target_dir}"
        ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(mkdir -p ${target_dir})\n"
      else
        __warning "[$(dirname "${target_dir}")] is not writable. using sudo....\n"
        ${__DRY} || sudo mkdir -p "${target_dir}"
        ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(sudo mkdir -p ${target_dir})\n"
      fi
    fi

    if [[ -w "${target_dir}" ]]; then
      ${__DRY} || ln -s "${src}" "${target}"
      ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(ln -s ${src} ${target})\n"
    else
      __warning "[${target_dir}] is not writable. using sudo....\n"
      ${__DRY} || sudo ln -s "${src}" "${target}"
      ${__DRY} && [[ "${__VERBOSE}" == true ]] && __success "(sudo ln -s ${src} ${target})\n"
    fi

    ${__DRY} || echo "${target}" >> "${__INSTALLATION_CACHE_FILE}"
    ${__DRY} && [[ "${__VERBOSE}" == true ]] && __info "(${target} >> ${__INSTALLATION_CACHE_FILE})\n"

  done < <(find "${__DOTS_DIR}/" \( -name "*.${__UNAME}.symlink" -o -name "*.generic.symlink" \) -print0 | sort -z)
}

export -f __install_links
