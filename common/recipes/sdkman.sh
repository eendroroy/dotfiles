#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_LOCATION}/__installer_template.sh"

executeInstallWithTargetCheck sdkman .sdkman "
curl -s \"https://get.sdkman.io\" | bash > /dev/null
export SDKMAN_DIR=\"${HOME}/.sdkman\"
[[ -s \"${HOME}/.sdkman/bin/sdkman-init.sh\" ]] && source \"${HOME}/.sdkman/bin/sdkman-init.sh\"
"