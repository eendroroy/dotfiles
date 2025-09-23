#!/usr/bin/env bash

__install_from_git sdkman .sdkman "
curl -s \"https://get.sdkman.io\" | bash > /dev/null
export SDKMAN_DIR=\"${HOME}/.sdkman\"
[[ -s \"${HOME}/.sdkman/bin/sdkman-init.sh\" ]] && source \"${HOME}/.sdkman/bin/sdkman-init.sh\"
"