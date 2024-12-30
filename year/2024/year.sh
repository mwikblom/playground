#!/opt/homebrew/bin/bash

source config.sh

YEAR=$1

if [ ${YEAR} -eq 2024 ]; then
  declare -a TEAMS=(mdd)

  clear

  echo "  .--.       .-.     .--.         ,--. "
  echo " ;  _  \   /    \   ;  _  \      /   | "
  echo "(___)\` |  |  .-. ; (___)\` |     / .' | "
  echo "     ' '  | |  | |      ' '    / / | | "
  echo "    / /   | |  | |     / /    / /  | | "
  echo "   / /    | |  | |    / /    /  \`--' |-."
  echo "  / /     | '  | |   / /     \`-----| |-'"
  echo " / '____  '  \`-' /  / '____        | |  "
  echo "(_______)  \`.__,'  (_______)      (___) "
  fluff 5

  echo -e "${GREEN}${YEAR}${NC} was a great year! The MDD team performed ${BLINK}${YELLOW}WONDERS${NC}"
  echo -e "Tickets resolved: ${BLINK}${RED}549${NC}"
  fluff 3

  echo -e "Let's have a look at what has been done during the year..."

  for t in "${TEAMS[@]}"; do
    fluff 5
    clear
    ./team.sh ${YEAR} ${t}
  done

  fluff 5
  clear
  fluff 5

  NEXT_YEAR=$((YEAR + 1))

  echo -e "Keep up the good work! ${BLINK}${YELLOW}${NEXT_YEAR} will be amazing!${NC}"

  fluff 5
fi