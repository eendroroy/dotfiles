#!/usr/bin/env bash

# Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

brew update
brew bundle --cleanup --file="${__DOTS_DIR}/rel:Brewfile.Darwin.symlink"
brew upgrade --greedy
brew cleanup --prune=all -v