#!/usr/bin/env bash

touch "${HOME}/.dotfiles_uninstall.txt"

SCRIPT_LOC="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function create_link() {
    if [[ -e ${2} ]]; then
        echo -e "  \033[94m ==> \033[33m~{${2}} already exists... Skipping. \033[39m"
    else
        echo -e "  \033[94m ==> \033[32mCreating symlink of ${file} \033[39m"
        echo "${2}" >> "${HOME}/.dotfiles_uninstall.txt"
        ln -s "${1}" "${2}"
    fi
}

function touch_file() {
    if [[ -e ${1} ]]; then
        echo -e "  \033[94m ==> \033[33m~{${1}} already exists... Skipping. \033[39m"
    else
        echo -e "  \033[94m ==> \033[32mCreating file ${1} \033[39m"
        touch "${1}"
    fi
}

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mCreating symlinks \033[39m"

# shellcheck disable=SC2044
for file in $( find "${SCRIPT_LOC}/$(uname)" -name "*.symlink" ); do
    create_link "${file}" "${HOME}/.$( basename "${file}" '.symlink')"
done

# shellcheck disable=SC2044
for file in $( find "${SCRIPT_LOC}/common" -name "*.symlink" ); do
    create_link "${file}" "${HOME}/.$( basename "${file}" '.symlink')"
done

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling to ~/.config \033[39m"
if [[ ! -d ${HOME}/.config ]]; then
	echo -e "  \033[94m ==> Creating ~/.config \033[39m"
	mkdir -p "${HOME}/.config"
fi

if [[ -d ${SCRIPT_LOC}/common/config ]]; then
    for config in "${SCRIPT_LOC}"/common/config/*; do
        create_link "${config}" "${HOME}/.config/$( basename "${config}" )"
    done
fi

if [[ -d ${SCRIPT_LOC}/$(uname)/config ]]; then
    for config in "${SCRIPT_LOC}"/"$(uname)"/config/*; do
        create_link "${config}" "${HOME}/.config/$( basename "${config}" )"
    done
fi

if [[ "$(uname)" == "Darwin" ]]; then
    create_link "${SCRIPT_LOC}/$(uname)/Brewfile" "${HOME}/Brewfile"
fi
