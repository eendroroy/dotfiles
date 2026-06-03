#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

function __help() {
  _____COMMAND="$(bold)$(fg_green)"
  _SUB_COMMAND="$(fg_yellow)"
  _____OPTIONS="$(fg_red)"
  _______RESET="$(reset_all)"

  printf "\n"
  printf "%b\n" "Usage: ${_____COMMAND}./dotfiles${_______RESET} ${_SUB_COMMAND}[command]${_______RESET} ${_____OPTIONS}[options]${_______RESET}"
  printf "\n"
  printf "%b\n" "Commands:"
  printf "  ${_SUB_COMMAND}%-13s${_______RESET} %s\n" "help      h " "Show this help"
  printf "  ${_SUB_COMMAND}%-13s${_______RESET} %s\n" "list      l " "List managed dotfiles"
  printf "  ${_SUB_COMMAND}%-13s${_______RESET} %s\n" "install   i " "Install symlinks"
  printf "  ${_SUB_COMMAND}%-13s${_______RESET} %s\n" "uninstall u " "Remove symlinks"
  printf "  ${_SUB_COMMAND}%-13s${_______RESET} %s\n" "update    up" "Re-install (force overwrite existing symlinks)"
  printf "\n"
  printf "%b\n" "Common options:"
  printf "  ${_____OPTIONS}%-13s${_______RESET} %s\n" "-s, --status " "Show status only"
  printf "  ${_____OPTIONS}%-13s${_______RESET} %s\n" "-v, --verbose" "Increase verbosity"
  printf "  ${_____OPTIONS}%-13s${_______RESET} %s\n" "-f, --force  " "Force overwrite"
  printf "  ${_____OPTIONS}%-13s${_______RESET} %s\n" "-n, --dry-run" "Simulate actions"
  printf "  ${_____OPTIONS}%-13s${_______RESET} %s\n" "-b, --brew   " "Install/Update Homebrew packages (Darwin only)"
  printf "\n"
  printf "Script location: ${_____OPTIONS}%s${_______RESET}\n" "${SCRIPT_LOCATION:-unknown}"
  printf "\n"
}


export -f __help