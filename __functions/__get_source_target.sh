#!/usr/bin/env bash

# Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __get_source_target() {
  local item=$1
  local target_name=${item#"${__DOTS_DIR}"/}
        target_name=${target_name%."${__UNAME}".symlink}
        target_name=${target_name%.generic.symlink}
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
