#!/usr/bin/env bash

# Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __list() {
  for type in generic "${__UNAME}"; do
    while IFS= read -r -d '' item
    do
      read -r source target <<< "$(__get_source_target "${item}" "${type}")"

      if [[ ${target} == "" ]]; then
        continue
      fi

      __m_primary "${target}"
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
    done < <(find "${__DOTS_DIR}/" -name "*.${type}.symlink" -print0)
  done
}

export -f __list
