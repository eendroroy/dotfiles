#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_LOCATION}/__installer_template.sh"

executeInstallWithTargetCheck asdf .asdf "
git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
"