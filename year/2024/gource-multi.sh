#!/opt/homebrew/bin/bash

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
#--fullscreen
gource -s 0.02 -hide-root --stop-at-end --start-date ${YEAR}-01-01 --stop-date ${YEAR}-12-31 --user-image-dir images/ --user-scale 7  combined.txt

rm combined.txt
