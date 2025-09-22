#!/usr/bin/env bash

source "${SCRIPT_LOCATION}/scripts/style.sh"

function executeInstallWithTargetCheck() {
  echo -e "$(printPrimaryMessage "Installing ${1}...")"
  if [[ -e ${HOME}/${2} ]]; then
    echo -e "$(printWarningMessage "${1} already installed. Skipping...")"
  else
    mkdir -p "${HOME}/${2}"
    eval "${3}"
    echo -e "$(printSecondaryMessage "${1} installed.")"
  fi
}