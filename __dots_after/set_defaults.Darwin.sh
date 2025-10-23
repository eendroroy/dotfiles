#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://www.fsf.org/licensing/licenses/agpl.html for details.

if [[ $(defaults read org.alacritty AppleFontSmoothing) != "0" ]]; then
  __m_primary "disabling font smoothing for Alacritty"
  defaults write org.alacritty AppleFontSmoothing -int 0
else
  ${__VERBOSE} && __m_warning "Skipping : font smoothing already disabled for Alacritty [$(defaults read org.alacritty AppleFontSmoothing)]"
fi
