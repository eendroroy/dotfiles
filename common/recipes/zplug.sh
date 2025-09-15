#!/usr/bin/env bash

source "${SCRIPT_LOCATION}/scripts/installer_template.sh"

executeInstallWithTargetCheck zplug .zplug "
git clone https://github.com/zplug/zplug.git ${HOME}/.zplug
"