#!/usr/local/bin/bash

source config.sh

YEAR=$1
shift

for i in $@
do
   pushd ${BASE_DIR}/${i} > /dev/null
   echo "   Number of commits: `git rev-list --count HEAD --since="01 Jan ${YEAR}"  --before="31 Dec ${YEAR}"`"
   echo "   Merged pull requests: `git log --since="01 Jan ${YEAR}"  --before="31 Dec ${YEAR}" | grep "Merge pull request" | grep -c $`"
   echo "   Created tags: `git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags | grep -c ${YEAR}`"
   popd > /dev/null
done
