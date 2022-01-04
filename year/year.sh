#!/usr/local/bin/bash

source config.sh

YEAR=$1

if [ ${YEAR} -ne 2021 ]; then
   echo "Invalid year"
   exit 1
fi

declare -a TEAMS=( chaos ceres charon )

clear

echo "_______________   ________  ____"
echo "\_____  \   _  \  \_____  \/_   |"
echo " /  ____/  /_\  \  /  ____/ |   |"
echo "/       \  \_/   \/       \ |   |"
echo "\_______ \_____  /\_______ \|___|"
echo "        \/     \/         \/"

fluff 10

echo -e "${GREEN}${YEAR}${NC} was a great year! The teams in Örebro performed ${BLINK}${YELLOW}WONDERS${NC}"

fluff 3

echo -e "Let's have a look at what has been done during the year..."

for t in "${TEAMS[@]}"
do
  fluff 10
  clear
  ./team.sh ${YEAR} ${t}
done

fluff 10
clear
fluff 10

NEXT_YEAR=$((YEAR + 1))

echo -e "Keep up the good work! ${BLINK}${YELLOW}${NEXT_YEAR} will be amazing!${NC}"

fluff 10
