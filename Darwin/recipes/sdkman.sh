#!/usr/bin/env bash
curl -s "https://get.sdkman.io" | bash

export SDKMAN_DIR="/home/indrajit/.sdkman"
[[ -s "/home/indrajit/.sdkman/bin/sdkman-init.sh" ]] && source "/home/indrajit/.sdkman/bin/sdkman-init.sh"

