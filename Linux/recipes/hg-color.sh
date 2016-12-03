#!/usr/bin/env bash
echo "############ installing hg-colors ############"
templateDir="/usr/share/mercurial/templates/mercurial-cli-templates"
echo "templatedir $templateDir"
if [[ -d $templateDir ]]; then
  echo "Mercurial cmdline maps already exists. Skipping ..."
else
  os=`uname`
  if [[ "${os}" == "Linux" ]]; then
    sudo mkdir -p /usr/share/mercurial/templates
    sudo sh -c 'cd /usr/share/mercurial/templates/ && git clone https://github.com/eendroroy/mercurial-cli-templates.git'
  elif [[ "${os}" == "Darwin" ]]; then
    sudo mkdir -p /usr/local/share/mercurial/templates
    sudo sh -c 'cd /usr/local/share/mercurial/templates/ && git clone https://github.com/eendroroy/mercurial-cli-templates.git'
  fi
fi
echo "##############################################"
