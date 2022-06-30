#!/bin/bash

# Description:  It contains methods to change the status (started or stopped) of a service.
# Author:       Luciano Sampaio 
# Date:         27-Jun-2022

changeServiceStatus() {
  #$1 - Type of Action
  #$2 - Service Name
  if [ $# -eq 2 ]; then
    logDebug "systemctl" $*
    sudo systemctl $1 $2
  fi
}

startService() {
  #$1 - Service Name
  if [ $# -eq 1 ]; then
    changeServiceStatus "start" "$1"
  fi
}

stopService() {
  #$1 - Service Name
  if [ $# -eq 1 ]; then
    changeServiceStatus "stop" "$1"
  fi
}
