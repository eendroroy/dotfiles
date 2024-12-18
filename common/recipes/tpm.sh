#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_LOCATION}/__installer_template.sh"

executeInstallWithTargetCheck tpm .tmux/plugins/tpm "
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
"