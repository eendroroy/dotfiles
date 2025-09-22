#!/usr/bin/env bash

source "${SCRIPT_LOCATION}/scripts/installer_template.sh"

executeInstallWithTargetCheck antigen .antigen "
git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen --depth=1
"