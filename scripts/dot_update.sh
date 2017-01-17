#!/usr/bin/env bash

COLOR='\033[1;34m'
NC='\033[0m'
paths=`find ~ -maxdepth 4 -name ".git" | sed "s|.git||g" | grep "/\." | grep -v "\.antigen/repos/"`
for path in ${paths}; do
  echo -e "${COLOR}    --> ${path}${NC}"
  pushd ${path} > /dev/null
  git pull > /dev/null
  popd > /dev/null
done
