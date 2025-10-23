#!/usr/bin/env bash

function __install_by_shell() {
  if [[ -e ${HOME}/${2} ]]; then
    ${__VERBOSE} && __m_warning "Skipping : ${1} already installed"
  else
    __m_primary "Installing ${1}..."
    ${__DRY} || mkdir -p "${HOME}/${2}"
    ${__DRY} || eval "${3}"
    ${__DRY} && ${__VERBOSE} && __m_warning "(${1} >> ${HOME}/${2})"
    __m_secondary "${1} installed"
  fi
}

export -f __install_by_shell