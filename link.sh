#!/usr/bin/env bash

DOTFILES="`pwd`/`uname` `pwd`/common"

echo -e "\nCreating symlinks"
echo "=============================="

linkables=$( find $DOTFILES -name "*.symlink" )
for file in $linkables; do
    target="$HOME/.$( basename $file '.symlink')"
    if [ -e $target ]; then
        echo "~{$target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink of $file"
        ln -s $file $target
    fi
done

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
	echo "Creating ~/.config"
	mkdir -p $HOME/.config
fi

if [[ $( ls `pwd`/common/config -1 ) ]]; then
    for config in `pwd`/common/config/*; do
        target=$HOME/.config/$( basename $config )
        if [ -e $target ]; then
            echo "~{$target#$HOME} already exists... Skipping."
        else
            echo "$config ==> $target"
            ln -s $config $target
        fi
    done
fi

if [[ $( ls `pwd`/`uname`/config -1 ) ]]; then
    for config in `pwd`/`uname`/config/*; do
        target=$HOME/.config/$( basename $config )
        if [ -e $target ]; then
            echo "~{$target#$HOME} already exists... Skipping."
        else
            echo "$config ==> $target"
            ln -s $config $target
        fi
    done
fi

