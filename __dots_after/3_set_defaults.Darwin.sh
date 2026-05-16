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
  __message "disabling font smoothing for Alacritty\n"
  defaults write org.alacritty AppleFontSmoothing -int 0
else
  ${__VERBOSE} && __warning "Skipping : font smoothing already disabled for Alacritty [$(defaults read org.alacritty AppleFontSmoothing)]\n"
fi

if [[ $(defaults read com.apple.desktopservices DSDontWriteNetworkStores) != "1" ]]; then
  __message "disabling creation of .DS_Store files on network volumes\n"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
else
  ${__VERBOSE} && __warning "Skipping : .DS_Store creation already disabled on network volumes [$(defaults read com.apple.desktopservices DSDontWriteNetworkStores)]\n"
fi

if [[ $(defaults read com.apple.desktopservices DSDontWriteUSBStores) != "1" ]]; then
  __message "disabling creation of .DS_Store files on USB volumes\n"
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
else
  ${__VERBOSE} && __warning "Skipping : .DS_Store creation already disabled on USB volumes [$(defaults read com.apple.desktopservices DSDontWriteUSBStores)]\n"
fi

if [[ $(defaults read -g KeyRepeat) != "3" ]]; then
  __message "setting key repeat rate to 3 (fast)\n"
  defaults write -g KeyRepeat -int 3
else
  ${__VERBOSE} && __warning "Skipping : key repeat rate already set to 3 [$(defaults read -g KeyRepeat)]\n"
fi

if [[ $(defaults read -g InitialKeyRepeat) != "15" ]]; then
  __message "setting initial key repeat delay to 15 (short)\n"
  defaults write -g InitialKeyRepeat -float 15
else
  ${__VERBOSE} && __warning "Skipping : initial key repeat delay already set to 15 [$(defaults read -g InitialKeyRepeat)]\n"
fi
