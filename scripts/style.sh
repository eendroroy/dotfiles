#!/usr/bin/env bash
printPrimaryMessage()   { echo -e " \e[38;5;5m ●\e[m \e[38;5;2m${1}\e[m"; }
printSecondaryMessage() { echo -e " \e[38;5;5m ─\e[m \e[38;5;4m${1}\e[m";               }
printWarningMessage()   { echo -e " \e[38;5;5m ─\e[m \e[38;5;3m${1}\e[m";               }