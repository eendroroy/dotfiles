#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __get_source_target() {
  local item="$1"
  local target_name="${item#"${__DOTS_DIR}"/}"
  target_name="${target_name%."${__UNAME}".symlink}"
  target_name="${target_name%.generic.symlink}"
  local prefix="${target_name:0:4}"

  case "${prefix}" in
    rel:) printf '%s %s\n' "${item}" "${HOME}/${target_name:4}" ;;
    abs:) printf '%s %s\n' "${item}" "/${target_name:4}" ;;
    *)
      __error "Unknown prefix '${prefix}', ignoring [${target_name} <- ${item}]" >&2
      return 1
      ;;
  esac
}

export -f __get_source_target
