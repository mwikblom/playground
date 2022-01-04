#!/usr/local/bin/bash

source config.sh

YEAR=$1
shift

for i in $@
do
  gource --output-custom-log log.txt "${BASE_DIR}/${i}"
  cat log.txt >> _combined.txt
  rm log.txt
done

sort -n _combined.txt > combined.txt
rm _combined.txt

gource -s 0.2 -hide-root --stop-at-end --start-date ${YEAR}-01-01 --stop-date ${YEAR}-12-31 --user-image-dir images/ --user-scale 3 --fullscreen  combined.txt

rm combined.txt
