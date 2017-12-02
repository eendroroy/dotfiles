#!/usr/bin/env bash

if [ ! -d ${HOME}/.config/fish ]; then
	echo "\033[32m ==> Creating ~/.config \033[39m"
	mkdir -p "${HOME}/.config/fish"
fi

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mCopying fishfile \033[39m"
cp "`pwd`/common/fish/fishfile" "${HOME}/.config/fish/fishfile"
