#!/opt/homebrew/bin/bash

source config.sh

YEAR=$1
shift

for i in $@
do
   pushd ${BASE_DIR}/${i} > /dev/null
   echo -e "   ${GREEN}Number of deploys to production: `git log --since="01 Jan ${YEAR}"  --before="31 Dec ${YEAR}" | grep "into live" | grep -c $`${NC}"
   popd > /dev/null
done
