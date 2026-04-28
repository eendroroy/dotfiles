#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# --- Colors ---
# Dim (faint),            Normal, and           Bright (bold) variants for all major colors
DIM_BLACK='\033[2;30m';   BLACK='\033[0;30m';   BRIGHT_BLACK='\033[1;30m'
DIM_RED='\033[2;31m';     RED='\033[0;31m';     BRIGHT_RED='\033[1;31m'
DIM_GREEN='\033[2;32m';   GREEN='\033[0;32m';   BRIGHT_GREEN='\033[1;32m'
DIM_YELLOW='\033[2;33m';  YELLOW='\033[0;33m';  BRIGHT_YELLOW='\033[1;33m'
DIM_BLUE='\033[2;34m';    BLUE='\033[0;34m';    BRIGHT_BLUE='\033[1;34m'
DIM_MAGENTA='\033[2;35m'; MAGENTA='\033[0;35m'; BRIGHT_MAGENTA='\033[1;35m'
DIM_CYAN='\033[2;36m';    CYAN='\033[0;36m';    BRIGHT_CYAN='\033[1;36m'
DIM_WHITE='\033[2;37m';   WHITE='\033[0;37m';   BRIGHT_WHITE='\033[1;37m'

BOLD='\033[1m'; UNDERLINE='\033[4m'; RESET='\033[0m'

# Label variables for messaging (with dimmer colors)
LBL_TITLE="        "
LBL____OK="${GREEN}✔    OK ${RESET}"
LBL___MSG="${BLUE}      → ${RESET}"
LBL__WARN="${YELLOW}⚠︎  WARN ${RESET}"
LBL___ERR="${RED}✖ ERROR ${RESET}"
LBL__INFO="${CYAN}ℹ  INFO ${RESET}"
LBL___RUN="${GREEN}⚙︎  (sh) ${RESET}"
LBL__LINK="${MAGENTA}∞  (ln) ${RESET}"

# Label functions for use in scripts
__lnk() { echo -ne "${LBL__LINK}$1"; }
__run() { echo -ne "${LBL___RUN}$1"; }

__title()    { echo -ne "${LBL_TITLE}${BOLD}${UNDERLINE}$1${RESET}"; }
__info()     { echo -ne "${LBL__INFO}$1"; }
__message()  { echo -ne "${LBL___MSG}$1"; }
__success()  { echo -ne "${LBL____OK}$1"; }
__warning()  { echo -ne "${LBL__WARN}$1"; }
__error()    { echo -ne "${LBL___ERR}$1"; }
__text()     { echo -ne "$1"; }

# No-label versions (just color, no label)
__title_nl()    { echo -ne "${DIM_WHITE}$1${RESET}"; }
__info_nl()     { echo -ne "${DIM_CYAN}$1${RESET}"; }
__message_nl()  { echo -ne "${DIM_BLUE}$1${RESET}"; }
__success_nl()  { echo -ne "${DIM_GREEN}$1${RESET}"; }
__warning_nl()  { echo -ne "${DIM_YELLOW}$1${RESET}"; }
__error_nl()    { echo -ne "${DIM_RED}$1${RESET}"; }
