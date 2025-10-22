#!/usr/bin/env bash

function __install_links() {
  for type in generic $(uname); do
    while IFS= read -r -d '' item
    do
      __destination="${HOME}/$(echo "${item}" | sed "s|${SCRIPT_LOCATION}/__dots/||;s|.${type}.symlink||")"
      if [ -e "${__destination}" ] || [ -L "${__destination}" ]; then
        ${__VERBOSE} && __m_warning "Skipping : ${__destination}"
      else
        mkdir -p "$(dirname "${__destination}")"
        ln -s "${item}" "${__destination}"
        __m_primary "[${item} -> ${__destination}]"
        echo "${__destination}" >> "${HOME}/.dotfiles_uninstall.txt"
      fi
    done < <(find "${SCRIPT_LOCATION}/__dots/" -name "*.${type}.symlink" -print0)
  done
}

export -f __install_links
