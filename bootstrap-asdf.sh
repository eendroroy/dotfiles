#!/usr/bin/env bash

SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "${SCRIPT_LOCATION}/util/style.sh"

PLUGINS=(nodejs python elixir golang ruby)

for plugin in "${PLUGINS[@]}"
do
  echo -e "$(printPrimaryMessage "adding ${plugin} plugin")"
  asdf plugin add "${plugin}"
done

for plugin in "${PLUGINS[@]}"
do
  echo -e "$(printPrimaryMessage "installing latest ${plugin}")"
  asdf install "${plugin}" latest

  echo -e "$(printPrimaryMessage "setting ${plugin}:latest as global")"
  asdf global "${plugin}" latest
done
