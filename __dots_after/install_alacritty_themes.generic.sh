#!/usr/bin/env bash

# Copyright (C) 2025 Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

__install_from_git 'alacritty/alacritty-theme' .config/alacritty/theme/external/am-theme
__install_from_git 'catppuccin/alacritty' .config/alacritty/theme/external/catppuccin