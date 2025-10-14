#!/usr/bin/env bash

__install_from_git asdf .asdf "
git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
"

if [[ -f "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf" ]]; then
  ${__VERBOSE} && __m_warning "asdf completions already exists. Skipping..."
else
  __m_secondary "Installing asdf completions"
  mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
  asd completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
fi
