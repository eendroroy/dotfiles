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
  COMMAND="$(bold)$(fg_green)"
  SUB_COMMAND="$(fg_yellow)"
  OPTIONS="$(fg_red)"
  RESET="$(reset_all)"

  printf "\n"
  printf "%b\n" "Usage: ${COMMAND}./dotfiles${RESET} ${SUB_COMMAND}[command]${RESET} ${OPTIONS}[options]${RESET}"
  printf "\n"
  printf "%b\n" "Commands:"
  printf "  ${SUB_COMMAND}%-13s${RESET} %s\n" "h, help     " "Show this help"
  printf "  ${SUB_COMMAND}%-13s${RESET} %s\n" "l, list     " "List managed dotfiles"
  printf "  ${SUB_COMMAND}%-13s${RESET} %s\n" "i, install  " "Install symlinks"
  printf "  ${SUB_COMMAND}%-13s${RESET} %s\n" "u, uninstall" "Remove symlinks"
  printf "\n"
  printf "%b\n" "Common options:"
  printf "  ${OPTIONS}%-13s${RESET} %s\n" "-s, --status " "Show status only"
  printf "  ${OPTIONS}%-13s${RESET} %s\n" "-v, --verbose" "Increase verbosity"
  printf "  ${OPTIONS}%-13s${RESET} %s\n" "-f, --force  " "Force overwrite"
  printf "  ${OPTIONS}%-13s${RESET} %s\n" "-n, --dry-run" "Simulate actions"
  printf "  ${OPTIONS}%-13s${RESET} %s\n" "-b, --brew   " "Install/Update Homebrew packages (Darwin only)"
  printf "\n"
  printf "Script location: ${OPTIONS}%s${RESET}\n" "${SCRIPT_LOCATION:-unknown}"
  printf "\n"
}


export -f __help