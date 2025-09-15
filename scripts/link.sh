#!/usr/bin/env bash

touch "${HOME}/.dotfiles_uninstall.txt"

source "${SCRIPT_LOCATION}/scripts/style.sh"

function create_link() {
    if [[ -e "${2}" ]]; then
        echo -e "$(printWarningMessage "[${1} -> ${2}] already exists... Skipping.")"
    else
        echo -e "$(printSecondaryMessage "[${1} -> ${2}]")"
        echo "${2}" >> "${HOME}/.dotfiles_uninstall.txt"
        ln -s "${1}" "${2}"
    fi
}

for prefix in "common" "$(uname)"; do
    echo -e "$(printPrimaryMessage "Installing from ${prefix} to ~/")"
    while IFS= read -r file; do
        create_link "${file}" "${HOME}/.$(basename "${file}" '.symlink')"
    done < <(find "${SCRIPT_LOCATION}/${prefix}" -name "*.symlink")
done

for prefix in "common" "$(uname)"; do
    for dir in ".config" "bin"; do
        if [[ -d ${SCRIPT_LOCATION}/${prefix}/${dir} ]]; then
          echo -e "$(printPrimaryMessage "Installing from ${prefix} to ~/${dir}")"
          if [[ ! -d ${HOME}/${dir} ]]; then
              echo -e "$(printPrimaryMessage "Creating ~/${dir}")"
              mkdir -p "${HOME}/${dir}"
          fi
          for linkable in "${SCRIPT_LOCATION}/${prefix}/${dir}"/*; do
              create_link "${linkable}" "${HOME}/${dir}/$( basename "${linkable}" )"
          done
      fi
    done
done

if [[ "$(uname)" == "Darwin" ]]; then
    create_link "${SCRIPT_LOCATION}/$(uname)/Brewfile" "${HOME}/Brewfile"
fi
