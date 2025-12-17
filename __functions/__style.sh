#!/usr/bin/env bash

# Copyright (C) Indrajit Roy <eendroroy@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

___PRIMARY_PREFIX=" $(dim)$(fg_bright_black) (-) $(reset_all)"
_SECONDARY_PREFIX=" $(dim)$(fg_bright_black) --- $(reset_all)"
___WARNING_PREFIX=" $(dim)$(fg_bright_black) --- $(reset_all)"
_____ERROR_PREFIX=" $(dim)$(  fg_bright_red) (-) $(reset_all)"
___SUCCESS_PREFIX=" $(dim)$( fg_bright_cyan) (-) $(reset_all)"
__CONTINUE_PREFIX="      "

__m_primary()     { echo -e "${___PRIMARY_PREFIX}$(fg_green)$(bold)${1}$(reset_all)"; }
__m_primary_c()   { echo -e "${__CONTINUE_PREFIX}$(fg_green)$(bold)${1}$(reset_all)"; }
__m_secondary()   { echo -e "${_SECONDARY_PREFIX}$(fg_cyan)$(dim)${1}$(reset_all)"; }
__m_secondary_c() { echo -e "${__CONTINUE_PREFIX}$(fg_cyan)$(dim)${1}$(reset_all)"; }
__m_warning()     { echo -e "${___WARNING_PREFIX}$(fg_yellow)$(dim)$(underline)${1}$(reset_all)"; }
__m_warning_c()   { echo -e "${__CONTINUE_PREFIX}$(fg_yellow)$(dim)$(underline)${1}$(reset_all)"; }
__m_error()       { echo -e "${_____ERROR_PREFIX}$(fg_bright_red)$(dim)$(underline)${1}$(reset_all)"; }
__m_error_c()     { echo -e "${__CONTINUE_PREFIX}$(fg_bright_red)$(dim)$(underline)${1}$(reset_all)"; }
__m_success()     { echo -e "${___SUCCESS_PREFIX}$(fg_bright_yellow)${1}$(reset_all)"; }
__m_success_c()   { echo -e "${__CONTINUE_PREFIX}$(fg_bright_yellow)${1}$(reset_all)"; }
