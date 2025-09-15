#!/usr/bin/env bash

source "${SCRIPT_LOCATION}/scripts/installer_template.sh"

executeInstallWithTargetCheck tpm .tmux/plugins/tpm "
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
"