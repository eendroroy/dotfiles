#!/usr/bin/env bash

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling SDKMAN \033[39m"
curl -s "https://get.sdkman.io" | bash > /dev/null

export SDKMAN_DIR="/home/indrajit/.sdkman"
[[ -s "/home/indrajit/.sdkman/bin/sdkman-init.sh" ]] && source "/home/indrajit/.sdkman/bin/sdkman-init.sh"

