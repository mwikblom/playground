#!/opt/homebrew/bin/bash

source config.sh

YEAR=$1
TEAM=$2

repo() {
  REPO=$1
  IN_PROD=$2
  SERVICE=$3

  fluff 1

  echo -e " -> ${PURPLE}${REPO}${NC} Let's have a look at some ${BLUE}statistics${NC}"
  fluff 1

  ./git-stats.sh ${YEAR} ${REPO}

  if [ $IN_PROD -eq 1 ]; then
    fluff 1
    ./count-deploys.sh ${YEAR} ${SERVICE}
  elif [ $IN_PROD -eq 2 ]; then
    fluff 1
    ./lib-releases.sh ${YEAR} ${REPO}
  elif [ $IN_PROD -eq 3 ]; then
    fluff 1
    ./legacy-releases.sh ${YEAR} ${REPO}
  fi

  fluff 1
  echo -e " ... and who is the ${RED}top committer?${NC}"
  fluff 1
  ./top-committers.sh ${YEAR} ${REPO}
}

declare -a MDD_MEMBERS=("Fredrik Larsson Stigbäck" "Johan Borgström" "Kapil Singh" "Mikael Wikblom" "Olle Mårtensson" "Per Edlund" "Johan Borgström" "Saif Islam" "Sylvain Sanchis" "Simon Sterckx")
declare -A MDD_SERVICE=([repo]=mdd-service [prod]=1 [service]=mdd-service)
declare -A MDD_CHECKOUT=([repo]=mdd-checkout [prod]=1 [service]=mdd-checkout)
declare -A MDD_COMMAND_CENTER=([repo]=mdd-command-center [prod]=1 [service]=mdd-command-center)
MDD_INGRESS="Best team ever!!!"

if [ $TEAM == "mdd" ]; then
  echo "                    ___       ___"
  echo "                   (   )     (   )"
  echo " ___ .-. .-.     .-.| |    .-.| |"
  echo "(   )   '   \   /   \ |   /   \ |"
  echo " |  .-.  .-. ; |  .-. |  |  .-. |"
  echo " | |  | |  | | | |  | |  | |  | |"
  echo " | |  | |  | | | |  | |  | |  | |"
  echo " | |  | |  | | | |  | |  | |  | |"
  echo " | |  | |  | | | '  | |  | '  | |"
  echo " | |  | |  | | ' \`-'  /  ' \`-'  /"
  echo "(___)(___)(___) \`.__,'    \`.__,' "
  fluff 1
  echo -e "${BLINK}${BLUE}*** ${MDD_INGRESS} ${NC}"
  fluff 1
  for m in "${MDD_MEMBERS[@]}"; do
    echo -e "${CYAN}   ${m}${NC}"
    wait_a_bit
  done

  fluff 3

  echo -e "${BLUE}Team ${TEAM}${NC} is responsible for the following service."
  repo ${MDD_SERVICE[repo]} ${MDD_SERVICE[prod]} ${MDD_SERVICE[service]}
  repo ${MDD_CHECKOUT[repo]} ${MDD_CHECKOUT[prod]} ${MDD_CHECKOUT[service]}
  repo ${MDD_COMMAND_CENTER[repo]} ${MDD_COMMAND_CENTER[prod]} ${MDD_COMMAND_CENTER[service]}

  fluff 3

  echo -e "Time to ${CYAN}VISUALIZE${NC} the commits"
  wait_a_bit
  ./gource-multi.sh ${YEAR} ${MDD_SERVICE[repo]} ${MDD_CHECKOUT[repo]} ${MDD_COMMAND_CENTER[repo]}
fi
