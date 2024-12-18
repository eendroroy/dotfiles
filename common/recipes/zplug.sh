#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_LOCATION}/__installer_template.sh"

executeInstallWithTargetCheck zplug .zplug "
git clone https://github.com/zplug/zplug.git ${HOME}/.zplug
"