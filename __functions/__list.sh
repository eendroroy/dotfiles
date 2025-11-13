#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __list() {
  while IFS= read -r -d '' item
  do
    __m_primary "RUN: ${item#"${__BEFORE_DIR}"/}"
  done < <(find "${__BEFORE_DIR}/" \( -name "*.generic.sh" -o -name "*.${__UNAME}.sh" \) -print0 | sort -z)

  while IFS= read -r -d '' item
  do
    read -r source target <<< "$(__get_source_target "${item}")"

    if [[ ${target} == "" ]]; then
      continue
    fi

    __m_primary "LNK: ${target}"
    [[ ${__VERBOSE} == true ]] && __m_secondary_c "source=${source}"
    if [[ ${__STATUS} == true ]]; then
      __real_path="$(readlink "${target}")"

      if [[ ! -e "${target}" ]]; then
        __m_error_c "Not installed"
      elif [[ ! -L "${target}" ]]; then
        __m_warning_c "Installed, but not a symlink"
      elif [[ ! -e "${__real_path}" ]]; then
        __m_error_c "Symlink broken"
      elif [[ "${__real_path}" != "${item}" ]]; then
        __m_warning_c "Installed from a different source {${__real_path}}"
      else
        __m_success_c "Installed"
      fi
    fi
  done < <(find "${__DOTS_DIR}/" \( -name "*.generic.symlink" -o -name "*.${__UNAME}.symlink" \) -type f -print0 | sort -z)

    while IFS= read -r -d '' item
  do
    __m_primary "RUN: ${item#"${__AFTER_DIR}"/}"
  done < <(find "${__AFTER_DIR}/" \( -name "*.generic.sh" -o -name "*.${__UNAME}.sh" \) -print0 | sort -z)

}

export -f __list
