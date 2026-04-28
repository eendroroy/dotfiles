#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __run_all_from_directory() {
  while IFS= read -r -d '' item; do
    __run "${item}\n"
    # shellcheck disable=SC1090
    source "${item}"
  done < <(find "${1}/" \( -name "*.generic.sh" -o -name "*.${__UNAME}.sh" \) -print0 | sort -z)
}

function __install() {
  mkdir -p "$(dirname "${__INSTALLATION_CACHE_FILE}")"
  __run_all_from_directory "${__PREINSTALL_DIR}"
  __run_all_from_directory "${__BEFORE_DIR}"
#  __install_links
  __run_all_from_directory "${__AFTER_DIR}"
}

export -f __install