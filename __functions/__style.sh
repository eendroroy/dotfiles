#!/usr/bin/env bash

# Copyright (c) 2025 Indrajit Roy
# Part of "dotfiles", licensed under GNU AGPLv3 or later
# See https://www.fsf.org/licensing/licenses/agpl.html for details.

___PRIMARY_HEADER=" $(dim)$(fg_bright_black)  $(reset_all)"
_SECONDARY_HEADER=" $(dim)$(fg_bright_black) 󰇘 $(reset_all)"
___WARNING_HEADER=" $(dim)$(fg_bright_black) 󰇘 $(reset_all)"
_____ERROR_HEADER=" $(dim)$(  fg_bright_red)  $(reset_all)"
___SUCCESS_HEADER=" $(dim)$( fg_bright_cyan)  $(reset_all)"
__CONTINUE_HEADER="    "

__m_primary()     { echo -e "${___PRIMARY_HEADER}$(fg_green)$(bold)${1}$(reset_all)"; }
__m_primary_c()   { echo -e "${__CONTINUE_HEADER}$(fg_green)$(bold)${1}$(reset_all)"; }
__m_secondary()   { echo -e "${_SECONDARY_HEADER}$(fg_cyan)$(dim)${1}$(reset_all)"; }
__m_secondary_c() { echo -e "${__CONTINUE_HEADER}$(fg_cyan)$(dim)${1}$(reset_all)"; }
__m_warning()     { echo -e "${___WARNING_HEADER}$(fg_yellow)$(dim)$(underline)${1}$(reset_all)"; }
__m_warning_c()   { echo -e "${__CONTINUE_HEADER}$(fg_yellow)$(dim)$(underline)${1}$(reset_all)"; }
__m_error()       { echo -e "${_____ERROR_HEADER}$(fg_bright_red)$(dim)$(underline)${1}$(reset_all)"; }
__m_error_c()     { echo -e "${__CONTINUE_HEADER}$(fg_bright_red)$(dim)$(underline)${1}$(reset_all)"; }
__m_success()     { echo -e "${___SUCCESS_HEADER}$(fg_bright_yellow)${1}$(reset_all)"; }
__m_success_c()   { echo -e "${__CONTINUE_HEADER}$(fg_bright_yellow)${1}$(reset_all)"; }
