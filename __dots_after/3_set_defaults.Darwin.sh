#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

if [[ $(defaults read org.alacritty AppleFontSmoothing) != "0" ]]; then
  __m_primary "disabling font smoothing for Alacritty"
  defaults write org.alacritty AppleFontSmoothing -int 0
else
  ${__VERBOSE} && __m_warning "Skipping : font smoothing already disabled for Alacritty [$(defaults read org.alacritty AppleFontSmoothing)]"
fi

if [[ $(defaults read com.apple.desktopservices DSDontWriteNetworkStores) != "1" ]]; then
  __m_primary "disabling creation of .DS_Store files on network volumes"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
else
  ${__VERBOSE} && __m_warning "Skipping : .DS_Store creation already disabled on network volumes [$(defaults read com.apple.desktopservices DSDontWriteNetworkStores)]"
fi

if [[ $(defaults read com.apple.desktopservices DSDontWriteUSBStores) != "1" ]]; then
  __m_primary "disabling creation of .DS_Store files on USB volumes"
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
else
  ${__VERBOSE} && __m_warning "Skipping : .DS_Store creation already disabled on USB volumes [$(defaults read com.apple.desktopservices DSDontWriteUSBStores)]"
fi
