#!/usr/bin/env bash

function __help() {
  echo -e "\033[1;36mUsage:\033[0m dotfiles [options]"
  echo
  echo -e "\033[1;36mOptions:\033[0m"
  echo -e "  \033[1;33m-h, --help\033[0m          Show this help message and exit"
  echo -e "  \033[1;33m-l, --list\033[0m          List all managed dotfiles"
  echo -e "      \033[1;33m-s, --status\033[0m    Show installation status"
  echo -e "  \033[1;33m-i, --install\033[0m       Install dotfiles"
  echo -e "  \033[1;33m-u, --uninstall\033[0m     Uninstall dotfiles"
  echo -e "      \033[1;33m-f, --force\033[0m     Force while uninstalling dotfiles"
  echo -e "  \033[1;33m-v, --verbose\033[0m       Enable verbose output"
  echo
}

export -f __help