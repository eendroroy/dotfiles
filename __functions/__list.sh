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
  while IFS= read -r -d '' item; do
    __run " ${item#${__BEFORE_DIR}/}\n"
  done < <(find "${__BEFORE_DIR}/" \( -name "*.generic.sh" -o -name "*.${__UNAME}.sh" \) -print0 | sort -z)

  while IFS= read -r -d '' item; do
    read -r source target <<< "$(__get_source_target "${item}")"

    if [[ ${target} == "" ]]; then
      continue
    fi

    __lnk " ${target}"
    [[ ${__VERBOSE} == true ]] && __text " <- ${DIM_YELLOW}${source}${RESET}"

    if [[ ${__STATUS} == true ]]; then
      local __real_path
      __real_path="$(readlink "${target}" 2>/dev/null || true)"

      if [[ ! -e "${target}" ]]; then
        __error_nl " Not installed"
      elif [[ ! -L "${target}" ]]; then
        __warning_nl " Installed, but not a symlink"
      elif [[ ! -e "${__real_path}" ]]; then
        __error_nl " Symlink broken"
      elif [[ "${__real_path}" != "${item}" ]]; then
        __warning_nl " Installed from a different source {${__real_path}}"
      else
        __success_nl " Installed"
      fi
    fi

    echo
  done < <(find "${__DOTS_DIR}/" \( -name "*.generic.symlink" -o -name "*.${__UNAME}.symlink" \) -print0 | sort -z)

  while IFS= read -r -d '' item; do
    __run " ${item#${__AFTER_DIR}/}\n"
  done < <(find "${__AFTER_DIR}/" \( -name "*.generic.sh" -o -name "*.${__UNAME}.sh" \) -print0 | sort -z)
}

export -f __list
