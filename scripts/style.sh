#!/usr/bin/env bash

printPrimaryMessage()    { echo -e "\n \e[38;5;5m ─\e[m \e[38;5;2m${1}\e[m"; }
printPrimaryMessageC()   { echo -e " \e[38;5;5m  \e[m \e[38;5;2m${1}\e[m"; }
printSecondaryMessage()  { echo -e " \e[38;5;5m  \e[m \e[38;5;4m${1}\e[m"; }
printSecondaryMessageC() { echo -e " \e[38;5;5m  \e[m \e[38;5;4m${1}\e[m"; }
printNoticedMessage()    { echo -e " \e[38;5;5m  \e[m \e[38;5;1m(!)\e[m \e[38;5;4m${1}\e[m"; }
printNoticedMessageC()   { echo -e " \e[38;5;5m  \e[m \e[38;5;1m(!)\e[m \e[38;5;4m${1}\e[m"; }
printWarningMessage()    { echo -e " \e[38;5;5m  \e[m \e[38;5;3m${1}\e[m"; }
printWarningMessageC()   { echo -e " \e[38;5;5m  \e[m \e[38;5;3m${1}\e[m"; }
printErrorMessage()      { echo -e " \e[38;5;5m  \e[m \e[38;5;1m${1}\e[m"; }
printErrorMessageC()     { echo -e " \e[38;5;5m  \e[m \e[38;5;1m${1}\e[m"; }