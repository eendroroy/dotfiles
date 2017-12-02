#!/usr/bin/env bash

if [ ! -d ${HOME}/.config/fish ]; then
	echo "Creating ~/.config"
	mkdir -p "${HOME}/.config/fish"
fi

cp "`pwd`/common/fish/fishfile" "${HOME}/.config/fish/fishfile"
