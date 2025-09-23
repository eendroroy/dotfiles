#!/usr/bin/env bash

function __list() {
  for type in generic $(uname); do
    while IFS= read -r -d '' item
    do
      __m_primary "$(echo "${item}" | sed "s|${SCRIPT_LOCATION}/__dots/||;s|.${type}.symlink||")"
      ${__VERBOSE} && __m_secondary "${item//${SCRIPT_LOCATION}\//}"
    done < <(find "${SCRIPT_LOCATION}/__dots/" -name "*.${type}.symlink" -print0)
  done
}

export -f __list
