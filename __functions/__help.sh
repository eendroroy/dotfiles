#!/usr/bin/env bash

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
  printf "  ${OPTIONS}%-13s${RESET} %s\n" "-s, --status"  "Show status only"
  printf "  ${OPTIONS}%-13s${RESET} %s\n" "-v, --verbose" "Increase verbosity"
  printf "  ${OPTIONS}%-13s${RESET} %s\n" "-f, --force"   "Force overwrite"
  printf "\n"
  printf "Script location: ${OPTIONS}%s${RESET}\n" "${SCRIPT_LOCATION:-unknown}"
  printf "\n"
}


export -f __help