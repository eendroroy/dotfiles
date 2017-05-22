#!/usr/bin/env bash
echo "############ installing hg-colors ############"
templateDir="/usr/local/share/mercurial/templates/mercurial-cli-templates"
echo "templatedir $templateDir"
if [[ -d $templateDir ]]; then
  echo "Mercurial cmdline maps already exists. Skipping ..."
else
  sudo mkdir -p /usr/local/share/mercurial/templates
  sudo sh -c 'cd /usr/local/share/mercurial/templates/ && git clone https://github.com/hyphenize/mercurial-cli-templates.git'
fi
echo "##############################################"
