#!/usr/bin/env bash

source "${SCRIPT_LOCATION}/scripts/installer_template.sh"

executeInstallWithTargetCheck sdkman .sdkman "
curl -s \"https://get.sdkman.io\" | bash > /dev/null
export SDKMAN_DIR=\"${HOME}/.sdkman\"
[[ -s \"${HOME}/.sdkman/bin/sdkman-init.sh\" ]] && source \"${HOME}/.sdkman/bin/sdkman-init.sh\"
"