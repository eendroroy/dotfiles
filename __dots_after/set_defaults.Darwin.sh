#!/usr/bin/env bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025 Indrajit Roy
# Part of `dotfiles`
# See https://www.fsf.org/licensing/licenses/agpl.html
# OR https://spdx.org/licenses/AGPL-3.0-or-later.html

if [[ $(defaults read org.alacritty AppleFontSmoothing) != "0" ]]; then
  __m_primary "disabling font smoothing for Alacritty"
  defaults write org.alacritty AppleFontSmoothing -int 0
else
  ${__VERBOSE} && __m_warning "Skipping : font smoothing already disabled for Alacritty [$(defaults read org.alacritty AppleFontSmoothing)]"
fi
