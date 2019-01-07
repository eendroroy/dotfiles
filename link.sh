#!/usr/bin/env bash

function create_link() {
    if [[ -e ${2} ]]; then
        echo -e "  \033[94m ==> \033[33m~{${2}} already exists... Skipping. \033[39m"
    else
        echo -e "  \033[94m ==> \033[32mCreating symlink of ${file} \033[39m"
        ln -s "${1}" "${2}"
    fi
}

function touch_file() {
    if [[ -e ${1} ]]; then
        echo -e "  \033[94m ==> \033[33m~{${1}} already exists... Skipping. \033[39m"
    else
        echo -e "  \033[94m ==> \033[32mCreating file ${1} \033[39m"
        touch ${1}
    fi
}

DOTFILES="$(pwd)/$(uname) $(pwd)/common"

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mCreating symlinks \033[39m"

linkables=$( find ${DOTFILES} -name "*.symlink" )
for file in ${linkables}; do
    create_link "${file}" "${HOME}/.$( basename "${file}" '.symlink')"
done

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling to ~/.config \033[39m"
if [[ ! -d ${HOME}/.config ]]; then
	echo -e "  \033[94m ==> Creating ~/.config \033[39m"
	mkdir -p "${HOME}/.config"
fi

if [[ -d $(pwd)/common/config ]]; then
    for config in "$(pwd)"/common/config/*; do
        create_link "${config}" "${HOME}/.config/$( basename "${config}" )"
    done
fi

if [[ -d $(pwd)/$(uname)/config ]]; then
    for config in "$(pwd)"/"$(uname)"/config/*; do
        create_link "${config}" "${HOME}/.config/$( basename "${config}" )"
    done
fi

if [[ "$(uname)" == "Darwin" ]]; then
    create_link "$(pwd)/$(uname)/Brewfile" "${HOME}/Brewfile"
fi

echo -e "  \033[94m ==> \033[32mCreating local config files \033[39m"
for file in ~/.config/nvim/config.local.vim ~/.wakatime.cfg; do
  touch_file ${file}
done
