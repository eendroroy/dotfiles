#!/usr/bin/env bash

touch "${HOME}/.dotfiles_uninstall.txt"

function create_link() {
    local __link
    __link=$(readlink "${2}")
    if [[ "${3}" != "true" && -e "${2}" ]]; then
        echo -e "$(printWarningMessage "Already exists. Skipping...")"
        echo -e "$(printWarningMessageC "  Source: '${1}'")"
        echo -e "$(printWarningMessageC "  Destination: '${2}']")"
    elif [[ "${3}" = "true" && -e "${2}" && "${__link}" != "${1}" ]]; then
        echo -e "$(printNoticedMessage "Already exists. Replacing...")"
        echo -e "$(printNoticedMessageC "  Source:          '${__link}'")"
        echo -e "$(printNoticedMessageC "  Expected Source: '${1}'")"
        echo -e "$(printNoticedMessageC "  Destination: '${2}']")"
        rm "${2}"
        echo "${2}" >> "${HOME}/.dotfiles_uninstall.txt"
        ln -s "${1}" "${2}"
    elif [[ "${3}" = "true" && -e "${2}" && "${__link}" = "${1}" ]]; then
        echo -e "$(printWarningMessage "Already exists. Skipping...")"
        echo -e "$(printWarningMessageC "  Source: '${1}'")"
        echo -e "$(printWarningMessageC "  Destination: '${2}']")"
    else
        echo -e "$(printSecondaryMessage "['${1}' -> '${2}']")"
        echo "${2}" >> "${HOME}/.dotfiles_uninstall.txt"
        ln -s "${1}" "${2}"
    fi
}

function remove_link() {
    local __link
    __link=$(readlink "${2}")
    if [[ ! -e ${__link} ]]; then
        echo -e "$(printWarningMessage "Does not exist. Skipping...")"
        echo -e "$(printWarningMessageC "  Source: '${1}'")"
        echo -e "$(printWarningMessageC "  Destination: '${2}']")"
    elif [[ "${3}" != "true" && ${__link} != "${1}" ]]; then
        echo -e "$(printWarningMessage "Exists from different source. Skipping...")"
        echo -e "$(printWarningMessageC "  Source:          '${__link}'")"
        echo -e "$(printWarningMessageC "  Expected Source: '${1}'")"
        echo -e "$(printWarningMessageC "  Destination: '${2}']")"
    elif [[ "${3}" = "true" && ${__link} != "${1}" ]]; then
        echo -e "$(printNoticedMessage "Exists from different source. Replacing...")"
        echo -e "$(printNoticedMessageC "  Source:          '${__link}'")"
        echo -e "$(printNoticedMessageC "  Expected Source: '${1}'")"
        echo -e "$(printNoticedMessageC "  Destination: '${2}']")"
        rm "${2}"
    else
        echo -e "$(printSecondaryMessage "Removing ['${__link}' -> '${2}'] ...")"
        rm "${2}"
    fi
}

function __handle_links() {
    local __command;
    __command=$(
        case $1 in
            install)
                echo -n 'create_link'
                ;;
            uninstall)
                echo -n 'remove_link'
                ;;
        esac
    )
    for prefix in "common" "$(uname)"; do
        echo -e "$(printPrimaryMessage "Installing from ${prefix} to ~/")"
        while IFS= read -r file; do
            ${__command} "${file}" "${HOME}/.$(basename "${file}" '.symlink')" ${2}
        done < <(find "${SCRIPT_LOCATION}/${prefix}" -name "*.symlink")
    done

    for prefix in "common" "$(uname)"; do
        for dir in ".config" "bin"; do
            if [[ -d ${SCRIPT_LOCATION}/${prefix}/${dir} ]]; then
              echo -e "$(printPrimaryMessage "Installing from ${prefix} to ~/${dir}")"
              if [[ ! -d ${HOME}/${dir} ]]; then
                  echo -e "$(printPrimaryMessage "Creating ~/${dir}")"
                  mkdir -p "${HOME}/${dir}"
              fi
              for linkable in "${SCRIPT_LOCATION}/${prefix}/${dir}"/*; do
                  ${__command} "${linkable}" "${HOME}/${dir}/$( basename "${linkable}" )" ${2}
              done
          fi
        done
    done

    if [[ "$(uname)" == "Darwin" ]]; then
        ${__command} "${SCRIPT_LOCATION}/$(uname)/Brewfile" "${HOME}/Brewfile" ${2}
    fi
}
