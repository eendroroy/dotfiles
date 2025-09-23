#!/usr/bin/env bash

function __help() {
    echo "Usage: dotfiles [options]"
    echo
    echo "Options:"
    echo "  -h, --help          Show this help message and exit"
    echo "  -i, --install       Install dotfiles"
    echo "  -u, --uninstall     Uninstall dotfiles"
    echo "  -s, --status        Show status of dotfiles"
    echo "  -l, --list          List all managed dotfiles"
    echo "  -v, --verbose       Enable verbose output"
    echo
}

export -f __help