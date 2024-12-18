#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_LOCATION}/__installer_template.sh"

executeInstallWithTargetCheck antigen .antigen "
git clone https://github.com/zsh-users/antigen.git ${HOME}/.antigen --depth=1
"