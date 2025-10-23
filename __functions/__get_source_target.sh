#!/usr/bin/env bash

function __get_source_target() {
  local item=$1
  local type=$2
  local target_name=${item#"${__DOTS_DIR}"/}
        target_name=${target_name%."${type}".symlink}
  local prefix=${target_name:0:4}

  if [[ "${prefix}" == "rel:" ]]; then
    echo "${item} ${HOME}/${target_name:4}"
  elif [[ "${prefix}" == "abs:" ]]; then
    echo "${item} ${target_name:4}"
  else
    __m_error "No prefix, ignoring [${target_name} <- ${item}]" >&2
  fi
}

export -f __get_source_target
