#!/usr/bin/env bash

__install_from_git asdf-vm/asdf .asdf

if [[ -f "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf" ]]; then
  ${__VERBOSE} && __m_warning "Skipping : asdf completions already exists"
else
  __m_secondary "Installing asdf completions"
  mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
  asd completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
fi