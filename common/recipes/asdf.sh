#!/usr/bin/env bash

source "${SCRIPT_LOCATION}/scripts/installer_template.sh"

executeInstallWithTargetCheck asdf .asdf "
git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
"