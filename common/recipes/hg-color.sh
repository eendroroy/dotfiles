#!/usr/bin/env bash

echo -e "  \033[94m ==> \033[39m"
echo -e "  \033[94m ==> \033[32mInstalling hg-colors \033[39m"
templateDir="/usr/local/share/mercurial/templates/mercurial-cli-templates"
echo -e "  \033[94m ==>   \033[34mtemplate dir ${templateDir} \033[39m"
if [[ -d ${templateDir} ]]; then
  echo -e "  \033[94m ==> \033[33mMercurial cmdline maps already exists. Skipping ... \033[39m"
else
  sudo mkdir -p /usr/local/share/mercurial/templates
  sudo sh -c 'cd /usr/local/share/mercurial/templates/ && git clone https://github.com/eendroroy/mercurial-cli-templates.git'
fi
