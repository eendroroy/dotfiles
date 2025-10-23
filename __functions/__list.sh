#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://www.fsf.org/licensing/licenses/agpl.html for details.

function __list() {
  for type in generic $(uname); do
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
