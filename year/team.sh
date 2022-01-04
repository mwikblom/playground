#!/usr/local/bin/bash

source config.sh

YEAR=$1
TEAM=$2

repo () {
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

declare -a CHARON_MEMBERS=( "Mary Wichmann" "Oscar Löfwenhamn" "Mikael Wikblom" "Johan Nilsson" )
declare -A SCANNPLAY=( [repo]=scannplay [prod]=1 [service]=scannplay-service )
CHARON_INGRESS="In kommer Charon!!!"

if [ $TEAM == "charon" ]; then
  echo "_________ .__"
  echo "\_   ___ \|  |__ _____ _______  ____   ____"
  echo "/    \  \/|  |  \\__  \\_  __ \/  _ \ /    \\"
  echo "\     \___|   Y  \/ __ \|  | \(  <_> )   |  \\"
  echo " \______  /___|  (____  /__|   \____/|___|  /"
  echo "        \/     \/     \/                  \/"
  fluff 1
  echo -e "${BLINK}${BLUE}*** ${CHARON_INGRESS} ${NC}"
  fluff 1
  for m in "${CHARON_MEMBERS[@]}"
  do
    echo -e "${CYAN}   ${m}${NC}"
    wait_a_bit
  done

  fluff 3

  echo -e "${BLUE}Team ${TEAM}${NC} is responsible for the following service."
  repo ${SCANNPLAY[repo]} ${SCANNPLAY[prod]} ${SCANNPLAY[service]}

  fluff 3

  echo -e "Time to ${CYAN}VISUALIZE${NC} the commits"
  wait_a_bit
  ./gource-multi.sh ${YEAR} ${SCANNPLAY[repo]}
fi

declare -a CHAOS_MEMBERS=( "Stefan Etoh" "Christopher Bengtsson" "Kapil Singh" "Simon Sterckx" )
declare -A BACKOFFICE_AUTH=( [repo]=backoffice-auth [prod]=1 [service]=backoffice-auth )
declare -A BACKOFFICE_AUTH_PROXY=( [repo]=backoffice-auth-proxy [prod]=0 [service]=backoffice-auth-proxy )
declare -A BACKOFFICE_SERVICE=( [repo]=backoffice-service [prod]=0 [service]=backoffice-service )
declare -A BACKOFFICE_SCRIPTS=( [repo]=backoffice-scripts [prod]=2 )
declare -A BACKOFFICE_UI_COMPONENTS=( [repo]=backoffice-ui-components [prod]=2 )
declare -A MERCHANT_PORTAL=( [repo]=merchant-portal [prod]=0 [service]=merchant-portal )
declare -A PAYPAL=( [repo]=paypal [prod]=3 )
declare -A ESLINT_CONFIG_TRUSTLY_REACT=( [repo]=eslint-config-trustly-react [prod]=2 )
declare -A CREATE_BACKOFFICE_COMPONENT=( [repo]=create-backoffice-component [prod]=2 )
declare -A PHOENIX_BACKOFFICE=( [repo]=phoenix-backoffice [prod]=1 [service]=command-center )
declare -A COMMAND_CENTER_VIEWS=( [repo]=command-center-views [prod]=0 [service]=command-center-views )
declare -A BACKOFFICE_OAUTH_SHARED_LIB=( [repo]=backoffice-oauth-shared-lib [prod]=2 )
CHAOS_INGRESS="Before there can be order, there must be Chaos!!!"

if [ $TEAM == "chaos" ]; then
  echo "_________ .__"
  echo "\_   ___ \|  |__ _____    ____  ______"
  echo "/    \  \/|  |  \\__  \  /  _ \/  ___/"
  echo "\     \___|   Y  \/ __ \(  <_> )___ \\"
  echo " \______  /___|  (____  /\____/____  >"
  echo "        \/     \/     \/           \/"

  echo -e "${BLINK}${BLUE}*** ${CHAOS_INGRESS} ${NC}"
  fluff 1
  for m in "${CHAOS_MEMBERS[@]}"
  do
    echo -e "${CYAN}   ${m}${NC}"
    wait_a_bit
  done

  fluff 3

  echo -e "${BLUE}Team ${TEAM}${NC} is develops and maintains a mighty number of services and libs. These guys take efficiency to a whole new level!"
  repo ${BACKOFFICE_AUTH[repo]} ${BACKOFFICE_AUTH[prod]} ${BACKOFFICE_AUTH[service]}
  repo ${BACKOFFICE_AUTH_PROXY[repo]} ${BACKOFFICE_AUTH_PROXY[prod]} ${BACKOFFICE_AUTH_PROXY[service]}
  repo ${BACKOFFICE_SERVICE[repo]} ${BACKOFFICE_SERVICE[prod]} ${BACKOFFICE_SERVICE[service]}
  repo ${BACKOFFICE_SCRIPTS[repo]} ${BACKOFFICE_SCRIPTS[prod]} ${BACKOFFICE_SCRIPTS[service]}
  repo ${BACKOFFICE_UI_COMPONENTS[repo]} ${BACKOFFICE_UI_COMPONENTS[prod]} ${BACKOFFICE_UI_COMPONENTS[service]}
  repo ${MERCHANT_PORTAL[repo]} ${MERCHANT_PORTAL[prod]} ${MERCHANT_PORTAL[service]}
  repo ${PAYPAL[repo]} ${PAYPAL[prod]} ${PAYPAL[service]}
  repo ${ESLINT_CONFIG_TRUSTLY_REACT[repo]} ${ESLINT_CONFIG_TRUSTLY_REACT[prod]} ${ESLINT_CONFIG_TRUSTLY_REACT[service]}
  repo ${CREATE_BACKOFFICE_COMPONENT[repo]} ${CREATE_BACKOFFICE_COMPONENT[prod]} ${CREATE_BACKOFFICE_COMPONENT[service]}
  repo ${PHOENIX_BACKOFFICE[repo]} ${PHOENIX_BACKOFFICE[prod]} ${PHOENIX_BACKOFFICE[service]}
  repo ${COMMAND_CENTER_VIEWS[repo]} ${COMMAND_CENTER_VIEWS[prod]} ${COMMAND_CENTER_VIEWS[service]}
  repo ${BACKOFFICE_OAUTH_SHARED_LIB[repo]} ${BACKOFFICE_OAUTH_SHARED_LIB[prod]} ${BACKOFFICE_OAUTH_SHARED_LIB[service]}

  fluff 3

  echo -e "So .... do you want to ${CYAN}SEE${NC} what we have done?"
  wait_a_bit
  echo -e "Really?"
  wait_a_bit
  echo -e "Hold on to your hat..."
  wait_a_bit
  echo -e "Here we go!"
  ./gource-multi.sh ${YEAR} ${BACKOFFICE_AUTH[repo]} ${BACKOFFICE_AUTH_PROXY[repo]} ${BACKOFFICE_SERVICE[repo]} ${BACKOFFICE_SCRIPTS[repo]} ${BACKOFFICE_UI_COMPONENTS[repo]} ${MERCHANT_PORTAL[repo]} ${PAYPAL[repo]} ${ESLINT_CONFIG_TRUSTLY_REACT[repo]} ${CREATE_BACKOFFICE_COMPONENT[repo]} ${PHOENIX_BACKOFFICE[repo]} ${COMMAND_CENTER_VIEWS[repo]} ${BACKOFFICE_OAUTH_SHARED_LIB[repo]}
fi

declare -a CERES_MEMBERS=( "Ola Hellgren" "Jonatan Berg" "Pontus Eliason" "Anders Israelsson" "Niclas Ivarsson" )
declare -A GLUEPAY_ROUTER=( [repo]=gluepay-router [prod]=0 [service]=gluepay-router )
declare -A PRODUCT_PLATFORM_ADAPTER=( [repo]=product-platform-adapter [prod]=0 [service]=product-platform-adapter )
declare -A NOTIFICATION_SERVICE=( [repo]=notification-service-1.0 [prod]=1 [service]=notification-service )
declare -A SIGNATURE_SERVICE=( [repo]=signature-service [prod]=0 [service]=signature-service )
declare -A PRODUCT_PLATFORM_MERCHANT_CLIENT=( [repo]=product-platform-merchant-client [prod]=0 )
declare -A TRUSTLY_TEST_SERVICE=( [repo]=trustly-test-service [prod]=0 [service]=trustly-test-service )
declare -A NOTIFICATION_DISPATCHER=( [repo]=notification-dispatcher [prod]=0 [service]=notification-dispatcher )
declare -A MERCHANT_SERVICE=( [repo]=merchant-service [prod]=1 [service]=merchant-service )
CERES_INGRESS="Don't call us, we'll notify you!!!"

if [ $TEAM == "ceres" ]; then
  echo "_________"
  echo "\_   ___ \  ___________   ____   ______"
  echo "/    \  \/_/ __ \_  __ \_/ __ \ /  ___/"
  echo "\     \___\  ___/|  | \/\  ___/ \___ \\"
  echo " \______  /\___  >__|    \___  >____  >"
  echo "        \/     \/            \/     \/"

  echo -e "${BLINK}${BLUE}*** ${CERES_INGRESS} ${NC}"
  fluff 1
  for m in "${CERES_MEMBERS[@]}"
  do
    echo -e "${CYAN}   ${m}${NC}"
    wait_a_bit
  done

  fluff 3

  echo -e "${BLUE}Team ${TEAM}${NC} is responsible for the following services and libs. The team has proven themselves efficient and highly valuable to all of Trustly"
  repo ${GLUEPAY_ROUTER[repo]} ${GLUEPAY_ROUTER[prod]} ${GLUEPAY_ROUTER[service]}
  repo ${PRODUCT_PLATFORM_ADAPTER[repo]} ${PRODUCT_PLATFORM_ADAPTER[prod]} ${PRODUCT_PLATFORM_ADAPTER[service]}
  repo ${NOTIFICATION_SERVICE[repo]} ${NOTIFICATION_SERVICE[prod]} ${NOTIFICATION_SERVICE[service]}
  repo ${SIGNATURE_SERVICE[repo]} ${SIGNATURE_SERVICE[prod]} ${SIGNATURE_SERVICE[service]}
  repo ${PRODUCT_PLATFORM_MERCHANT_CLIENT[repo]} ${PRODUCT_PLATFORM_MERCHANT_CLIENT[prod]} ${PRODUCT_PLATFORM_MERCHANT_CLIENT[service]}
  repo ${TRUSTLY_TEST_SERVICE[repo]} ${TRUSTLY_TEST_SERVICE[prod]} ${TRUSTLY_TEST_SERVICE[service]}
  repo ${NOTIFICATION_DISPATCHER[repo]} ${NOTIFICATION_DISPATCHER[prod]} ${NOTIFICATION_DISPATCHER[service]}
  repo ${MERCHANT_SERVICE[repo]} ${MERCHANT_SERVICE[prod]} ${MERCHANT_SERVICE[service]}

  fluff 3

  echo -e "So .... are you ready for ${BLINK}${CYAN}THIS${NC}?"
  wait_a_bit
  echo -e "Wait for it..."
  wait_a_bit
  echo -e "GO! GO! GO!"
  ./gource-multi.sh ${YEAR} ${GLUEPAY_ROUTER[repo]} ${PRODUCT_PLATFORM_ADAPTER[repo]} ${NOTIFICATION_SERVICE[repo]} ${SIGNATURE_SERVICE[repo]} ${PRODUCT_PLATFORM_MERCHANT_CLIENT[repo]} ${TRUSTLY_TEST_SERVICE[repo]} ${NOTIFICATION_DISPATCHER[repo]} ${MERCHANT_SERVICE[repo]} ${CREATE_BACKOFFICE_COMPONENT[repo]}
fi
