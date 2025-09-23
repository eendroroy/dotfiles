#!/usr/bin/env bash

function __list() {
  for type in generic $(uname); do
    while IFS= read -r -d '' item
    do
      __target="$(echo "${item}" | sed "s|${SCRIPT_LOCATION}/__dots/||;s|.${type}.symlink||")"
      __m_primary "${__target}"
      ${__VERBOSE} && __m_secondary_c "${item//${SCRIPT_LOCATION}\//}"
      if [[ ${__STATUS} == true ]]; then
        __real_path="$(readlink "${HOME}/${__target}")"

        if [[ ! -e "${HOME}/${__target}" ]]; then
          __m_error_c "Not installed"
        elif [[ ! -L "${HOME}/${__target}" ]]; then
          __m_warning_c "Installed, but not a symlink"
        elif [[ ! -e "${__real_path}" ]]; then
          __m_error_c "Symlink broken"
        elif [[ "${__real_path}" != "${item}" ]]; then
          __m_warning_c "Installed from a different source {${__real_path}}"
        else
          __m_secondary_c "Installed"
        fi
      fi
    done < <(find "${SCRIPT_LOCATION}/__dots/" -name "*.${type}.symlink" -print0)
  done
}

export -f __list
