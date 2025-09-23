#!/usr/bin/env bash

__m_primary()     { echo -e " \e[38;5;5m ─\e[m \e[38;5;2m${1}\e[m"; }
__m_primary_c()   { echo -e " \e[38;5;5m  \e[m \e[38;5;2m${1}\e[m"; }
__m_secondary()   { echo -e " \e[38;5;5m ─\e[m \e[38;5;4m${1}\e[m"; }
__m_secondary_c() { echo -e " \e[38;5;5m  \e[m \e[38;5;4m${1}\e[m"; }
__m_notice()      { echo -e " \e[38;5;5m ─\e[m \e[38;5;1m(!)\e[m \e[38;5;4m${1}\e[m"; }
__m_notice_c()    { echo -e " \e[38;5;5m  \e[m \e[38;5;1m(!)\e[m \e[38;5;4m${1}\e[m"; }
__m_warning()     { echo -e " \e[38;5;5m ─\e[m \e[38;5;3m${1}\e[m"; }
__m_warning_c()   { echo -e " \e[38;5;5m  \e[m \e[38;5;3m${1}\e[m"; }
__m_error()       { echo -e " \e[38;5;5m ─\e[m \e[38;5;1m${1}\e[m"; }
__m_error_c()     { echo -e " \e[38;5;5m  \e[m \e[38;5;1m${1}\e[m"; }

export -f __m_primary
export -f __m_primary_c
export -f __m_secondary
export -f __m_secondary_c
export -f __m_notice
export -f __m_notice_c
export -f __m_warning
export -f __m_warning_c
export -f __m_error
export -f __m_error_c