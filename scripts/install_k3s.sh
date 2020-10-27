#!/bin/bash

#    _____           _        _ _   _____                  _               
#   |_   _|         | |      | | | |  __ \                | |              
#     | |  _ __  ___| |_ __ _| | | | |__) |__ _ _ __   ___| |__   ___ _ __ 
#     | | | '_ \/ __| __/ _` | | | |  _  // _` | '_ \ / __| '_ \ / _ \ '__|
#    _| |_| | | \__ \ || (_| | | | | | \ \ (_| | | | | (__| | | |  __/ |   
#   |_____|_| |_|___/\__\__,_|_|_| |_|  \_\__,_|_| |_|\___|_| |_|\___|_|   
#                              _  ______      
#                             | |/ /___ \     
#                             | ' /  __) |___ 
#                             |  <  |__ </ __|
#                             | . \ ___) \__ \
#                             |_|\_\____/|___/
                 
# Install Rancher K3s via script
        
set -e -o pipefail -u

echo "START >=================================================> INSTALLING RANCHER K3S"

PID=$$
echo "PID: ${PID}"

SCRIPT_NAME=$(basename $0)
echo "SCRIPT_NAME: ${SCRIPT_NAME}"

K3S_INSTALL_COMMAND="$@"
echo "K3S_INSTALL_COMMAND: ${K3S_INSTALL_COMMAND}"

{
  echo "Download the K3s install script and execute it..."
  eval "$K3S_INSTALL_COMMAND"
} || {
  echo "FAILED >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~< TRYING TO INSTALL K3S! :-(" 1>&2
  exit 255
}

function error() {
  JOB="$0"
  LAST_LINE="$1"
  LAST_ERROR="$2"
  echo "ERROR in ${JOB} : line ${LAST_LINE} with exit code ${LAST_ERROR}"  
  exit 255
}

trap "error ${LINENO} ${?}" ERR

echo "END <================================================< RANCHER K3S INSTALLED :-)"

exit 0