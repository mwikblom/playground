#!/opt/homebrew/bin/bash

source config.sh

YEAR=$1
shift

for i in $@
do
   pushd ${BASE_DIR}/${i} > /dev/null
   git shortlog -s -n --all --no-merges --since="01 Jan ${YEAR}"  --before="31 Dec ${YEAR}"
   popd > /dev/null
done
