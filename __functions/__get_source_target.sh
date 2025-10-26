#!/usr/bin/env bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025 Indrajit Roy
# Part of `dotfiles`
# See https://www.fsf.org/licensing/licenses/agpl.html
# OR https://spdx.org/licenses/AGPL-3.0-or-later.html

function __get_source_target() {
  local item=$1
  local type=$2
  local target_name=${item#"${__DOTS_DIR}"/}
        target_name=${target_name%."${type}".symlink}
  local prefix=${target_name:0:4}

  if [[ "${prefix}" == "rel:" ]]; then
    echo "${item} ${HOME}/${target_name:4}"
  elif [[ "${prefix}" == "abs:" ]]; then
    echo "${item} /${target_name:4}"
  else
    __m_error "No prefix, ignoring [${target_name} <- ${item}]" >&2
  fi
}

export -f __get_source_target
