#!/usr/local/bin/bash

source config.sh

YEAR=$1
shift

for i in $@
do
   pushd ${BASE_DIR}/${i} > /dev/null
   echo -e "   ${GREEN}Number of releases: `git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags | grep -c ${YEAR}`${NC}"
   popd > /dev/null
done
