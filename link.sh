#!/usr/bin/env bash

function create_link() {
    if [ -e $2 ]; then
        echo -e "  \033[94m ==> \033[33m~{$2} already exists... Skipping. \033[39m"
    else
        echo -e "  \033[94m ==> \033[32mCreating symlink of $file \033[39m"
        ln -s $1 $2
    fi
}

DOTFILES="`pwd`/`uname` `pwd`/common"

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mCreating symlinks \033[39m"

linkables=$( find ${DOTFILES} -name "*.symlink" )
for file in $linkables; do
    create_link $file "${HOME}/.$( basename $file '.symlink')"
done

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling to ~/.config \033[39m"
if [ ! -d ${HOME}/.config ]; then
	echo -e "  \033[94m ==> Creating ~/.config \033[39m"
	mkdir -p ${HOME}/.config
fi

if [[ -d `pwd`/common/config ]]; then
    for config in $( ls -1 `pwd`/common/config ); do
        create_link $config "${HOME}/.config/$( basename $config )"
    done
fi

if [[ -d `pwd`/`uname`/config ]]; then
    for config in $( ls -1 `pwd`/`uname`/config ); do
        create_link $config "${HOME}/.config/$( basename $config )"
    done
fi

if [[ "`uname`" == "Darwin" ]]; then
    create_link "`pwd`/`uname`/Brewfile" "${HOME}/Brewfile"
fi

