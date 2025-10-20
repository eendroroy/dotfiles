#!/usr/bin/env bash

if [[ $(defaults read org.alacritty AppleFontSmoothing) != "0" ]]; then
  __m_primary "disabling font smoothing for Alacritty"
  defaults write org.alacritty AppleFontSmoothing -int 0
else
  ${__VERBOSE} && __m_warning "Skipping : font smoothing already disabled for Alacritty [$(defaults read org.alacritty AppleFontSmoothing)]"
fi
