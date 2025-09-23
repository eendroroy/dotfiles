#!/usr/bin/env bash

function __install_from_git() {
  if [[ -e ${HOME}/${2} ]]; then
    ${__VERBOSE} && echo -e "$(__m_warning "${1} already installed. Skipping...")"
  else
    echo -e "$(__m_primary "Installing ${1}...")"
    mkdir -p "${HOME}/${2}"
    eval "${3}"
    echo -e "$(__m_secondary "${1} installed.")"
  fi
}

function __install_links() {
  for type in generic $(uname); do
    while IFS= read -r -d '' item
    do
      __destination="${HOME}/$(echo "${item}" | sed "s|${SCRIPT_LOCATION}/__dots/||;s|.${type}.symlink||")"
      if [ -e "${__destination}" ] || [ -L "${__destination}" ]; then
        ${__VERBOSE} && __m_warning "Skipping existing file: ${__destination}"
      else
        mkdir -p "$(dirname "${__destination}")"
        ln -s "${item}" "${__destination}"
        __m_primary "[${item} -> ${__destination}]"
        echo "${__destination}" >> "${HOME}/.dotfiles_uninstall.txt"
      fi
    done < <(find "${SCRIPT_LOCATION}/__dots/" -name "*.${type}.symlink" -print0)
  done
}

function __uninstall() {
  if [ -f "${HOME}/.dotfiles_uninstall.txt" ]; then
    while IFS= read -r line
    do
      __m_warning "Removing ${line}"
      rm "${line}"
    done < <(cat "${HOME}/.dotfiles_uninstall.txt")
    rm "${HOME}/.dotfiles_uninstall.txt"
  else
    ${__VERBOSE} && __m_warning "No uninstall file found at ${HOME}/.dotfiles_uninstall.txt"
    ${__VERBOSE} && __m_warning_c "Nothing to uninstall"
  fi

  if [[ ${__FORCE} ]]; then
      for type in generic $(uname); do
    while IFS= read -r -d '' item
    do
      __destination="${HOME}/$(echo "${item}" | sed "s|${SCRIPT_LOCATION}/__dots/||;s|.${type}.symlink||")"
      if [ -e "${__destination}" ] || [ -L "${__destination}" ]; then
        rm -rf "${__destination}"
        __m_primary "Removed existing file: ${__destination}"
      else
        ${__VERBOSE} && __m_warning "File not found, skipping: ${__destination}"
      fi
    done < <(find "${SCRIPT_LOCATION}/__dots/" -name "*.${type}.symlink" -print0)
  done
  fi


}

export -f __install_from_git
export -f __install_links
export -f __uninstall