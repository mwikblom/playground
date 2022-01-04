#!/usr/local/bin/bash

source config.sh

YEAR=$1
shift

for i in $@
do
   pushd ${BASE_DIR}/phoenix-config > /dev/null
   echo -e "   ${GREEN}Number of deploys to production: `git log --since="01 Jan ${YEAR}"  --before="31 Dec ${YEAR}" | grep "Merge pull request" | grep ${i} | grep -c $`${NC}"
   popd > /dev/null
done
