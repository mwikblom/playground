#!/opt/homebrew/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'
BLINK='\033[5m'

SHORT_WAIT_IN_SEC=0.1
DEFAULT_WAIT_IN_SEC=1
LONG_WAIT_IN_SEC=2

BASE_DIR="../../.."

fluff () {
  for (( i=1; i<=$1; i++ )) do
    echo ""
    wait_a_bit ${SHORT_WAIT_IN_SEC}
  done
  wait_a_bit ${LONG_WAIT_IN_SEC}
}

wait_a_bit () {
  sleep ${1:-${DEFAULT_WAIT_IN_SEC}}
}
