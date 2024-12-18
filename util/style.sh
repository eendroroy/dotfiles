#!/usr/bin/env bash

function colorText() {
  printf "\e[38;2;%s;%s;%sm" "${1}" "${2}" "${3}"
}

function colorBg() {
  printf "\e[48;2;%s;%s;%sm" "${1}" "${2}" "${3}"
}

reset="\e[m"                # ANSI CODE 0   → resets all styles, it's the same of \e[0m
bold="\e[1m"                # ANSI CODE 1   → increases intensity, with a slight color change
rbold="\e[22m"              # ANSI CODE 22  → resets bold or dim (they are mutually exclusive styles)
dim="\e[2m"                 # ANSI CODE 2   → decreases intensity, with a slight color change
rdim="\e[22m"               # ANSI CODE 22  → resets bold or dim (they are mutually exclusive styles)
italic="\e[3m"              # ANSI CODE 3   → italic
ritalic="\e[23m"            # ANSI CODE 23  → resets italic
underline="\e[4m"           # ANSI CODE 4   → underline
runderline="\e[24m"         # ANSI CODE 24  → resets underline or doubleunderline (they are mutually exclusive styles)
doubleunderline="\e[21m"    # ANSI CODE 21  → double underline (not supported by Konsole)
rdoubleunderline="\e[24m"   # ANSI CODE 24  → resets underline or doubleunderline (they are mutually exclusive styles)
curlyunderline="\e[4:3m"    # ANSI CODE 4:3 → curly underline (not supported by Konsole)
rcurlyunderline="\e[4:0m"   # ANSI CODE 4:0 → resets curly underline
blink="\e[5m"               # ANSI CODE 5   → blink
rblink="\e[25m"             # ANSI CODE 25  → resets blink
reverse="\e[7m"             # ANSI CODE 7   → swaps text and background colors
rreverse="\e[27m"           # ANSI CODE 27  → resets reverse
hidden="\e[8m"              # ANSI CODE 8   → characters not displayed, helpful for passwords
rhidden="\e[28m"            # ANSI CODE 28  → resets hidden
strikethrough="\e[9m"       # ANSI CODE 9   → characters crossed by a central line
rstrikethrough="\e[29m"     # ANSI CODE 29  → resets strikethrough
overline="\e[53m"           # ANSI CODE 53  → overline
roverline="\e[55m"          # ANSI CODE 55  → resets overline


PRIMARY_SYMBOL="   $(colorText 129 161 193)---${reset}"
SECONDARY_SYMBOL="      "

PRIMARY_TEXT_STYLE="${bold}$(colorText 116 201 115)"
SECONDARY_TEXT_STYLE="$(colorText 115 177 201)"
WARNING_TEXT_STYLE="${underline}$(colorText 225 235 141)"

function printPrimaryMessage() {
  printf "%s  %s%s%s" "${PRIMARY_SYMBOL}" "${PRIMARY_TEXT_STYLE}" "${1}" "${reset}"
}

function printSecondaryMessage() {
  printf "%s  %s%s%s" "${SECONDARY_SYMBOL}" "${SECONDARY_TEXT_STYLE}" "${1}" "${reset}"
}

function printWarningMessage() {
  printf "%s  %s%s%s" "${SECONDARY_SYMBOL}" "${WARNING_TEXT_STYLE}" "${1}" "${reset}"
}