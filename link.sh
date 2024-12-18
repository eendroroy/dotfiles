#!/usr/bin/env bash

touch "${HOME}/.dotfiles_uninstall.txt"

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "${SCRIPT_LOCATION}/util/style.sh"

function create_link() {
    if [[ -e "${2}" ]]; then
        echo -e "$(printWarningMessage "{${2}} already exists... Skipping.")"
    else
        echo -e "$(printSecondaryMessage "[${1} -> ${2}]")"
        echo "${2}" >> "${HOME}/.dotfiles_uninstall.txt"
        ln -s "${1}" "${2}"
    fi
}

echo -e "$(printPrimaryMessage "Creating symlinks")"

# shellcheck disable=SC2044
for file in $( find "${SCRIPT_LOCATION}/$(uname)" -name "*.symlink" ); do
    create_link "${file}" "${HOME}/.$( basename "${file}" '.symlink')"
done

# shellcheck disable=SC2044
for file in $( find "${SCRIPT_LOCATION}/common" -name "*.symlink" ); do
    create_link "${file}" "${HOME}/.$( basename "${file}" '.symlink')"
done

echo -e "$(printPrimaryMessage "Installing to ~/.config")"
if [[ ! -d ${HOME}/.config ]]; then
	echo -e "$(printPrimaryMessage "Creating ~/.config")"
	mkdir -p "${HOME}/.config"
fi

if [[ -d ${SCRIPT_LOCATION}/common/config ]]; then
    for config in "${SCRIPT_LOCATION}"/common/config/*; do
        create_link "${config}" "${HOME}/.config/$( basename "${config}" )"
    done
fi

if [[ -d ${SCRIPT_LOCATION}/$(uname)/config ]]; then
    for config in "${SCRIPT_LOCATION}"/"$(uname)"/config/*; do
        create_link "${config}" "${HOME}/.config/$( basename "${config}" )"
    done
fi

if [[ "$(uname)" == "Darwin" ]]; then
    create_link "${SCRIPT_LOCATION}/$(uname)/Brewfile" "${HOME}/Brewfile"
fi
