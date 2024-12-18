#!/usr/bin/env bash

PLUGINS=(gradle maven nodejs python elixir golang ruby)

for plugin in "${PLUGINS[@]}"
do
  echo "==> adding ${plugin} plugin"
  asdf plugin add "${plugin}"
done


for plugin in "${PLUGINS[@]}"
do
  echo "==> installing latest ${plugin}"
  asdf install "${plugin}" latest

  echo "==> setting ${plugin}:latest as global"
  asdf global "${plugin}" latest
done
