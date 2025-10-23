#!/usr/bin/env bash

__m_primary()     { echo -e " $(dim)$(fg_bright_black)  $(reset_all)$(fg_green)$(bold)${1}$(reset_all)"; }
__m_primary_c()   { echo -e " $(dim)$(fg_bright_black)   $(reset_all)$(fg_green)$(bold)${1}$(reset_all)"; }
__m_secondary()   { echo -e " $(dim)$(fg_bright_black) 󰇘 $(reset_all)$(fg_cyan)$(dim)${1}$(reset_all)"; }
__m_secondary_c() { echo -e " $(dim)$(fg_bright_black)   $(reset_all)$(fg_cyan)$(dim)${1}$(reset_all)"; }
__m_warning()     { echo -e " $(dim)$(fg_bright_black) 󰇘 $(reset_all)$(fg_yellow)$(dim)$(underline)${1}$(reset_all)"; }
__m_warning_c()   { echo -e " $(dim)$(fg_bright_black)   $(reset_all)$(fg_yellow)$(dim)$(underline)${1}$(reset_all)"; }
__m_error()       { echo -e " $(dim)$(fg_bright_red)  $(reset_all)$(fg_bright_red)$(dim)$(underline)${1}$(reset_all)"; }
__m_error_c()     { echo -e " $(dim)$(fg_bright_black)   $(reset_all)$(fg_bright_red)$(dim)$(underline)${1}$(reset_all)"; }

export -f __m_primary
export -f __m_primary_c
export -f __m_secondary
export -f __m_secondary_c
export -f __m_warning
export -f __m_warning_c
export -f __m_error
export -f __m_error_c