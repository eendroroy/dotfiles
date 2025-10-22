#!/usr/bin/env bash

function __install_from_git() {
  if [[ -e ${HOME}/${2} ]]; then
    ${__VERBOSE} && __m_warning "Skipping : ${1} already installed"
  else
    __m_primary "Installing ${1}..."
    mkdir -p "${HOME}/${2}"
    eval "${3}"
    __m_secondary "${1} installed"
  fi
}

export -f __install_from_git