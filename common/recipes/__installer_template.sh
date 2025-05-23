#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "${SCRIPT_LOCATION}/../../util/style.sh"

function executeInstallWithTargetCheck() {
  echo -e "$(printPrimaryMessage "Installing ${1} for zsh")"
  if [[ -e ${HOME}/${2} ]]; then
    echo -e "$(printWarningMessage "${1} already installed. Skipping...")"
  else
    eval "${3}"
    echo -e "$(printSecondaryMessage "${1} installed.")"
  fi
}