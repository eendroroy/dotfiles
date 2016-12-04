#!/usr/bin/env bash
echo "############ installing hg-colors ############"
templateDir="/usr/share/mercurial/templates/mercurial-cli-templates"
echo "templatedir $templateDir"
if [[ -d $templateDir ]]; then
  echo "Mercurial cmdline maps already exists. Skipping ..."
else
  sudo mkdir -p /usr/share/mercurial/templates
  sudo sh -c 'cd /usr/share/mercurial/templates/ && git clone https://github.com/eendroroy/mercurial-cli-templates.git'
fi
echo "##############################################"
