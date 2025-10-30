#!/usr/bin/env bash

# Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __source_all_from_directory() {
  # shellcheck disable=SC1090
  while IFS= read -r item; do  source "${item}"; done < \
    <(find "${1}/" \( -name "*.generic.sh" -o -name "*.${__UNAME}.sh" \) -type f)
}

function __install() {
  __source_all_from_directory "${__PREINSTALL_DIR}"
  __source_all_from_directory "${__BEFORE_DIR}"
  __install_links
  __source_all_from_directory "${__AFTER_DIR}"
}

export -f __install