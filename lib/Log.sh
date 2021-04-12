#!/bin/bash

# Description:  It contains methods related with log messages.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

getCurrentDateTime() {
  date "+%Y-%m-%d %k:%M:%S"
}

logMessage () {
  echo $(getCurrentDateTime) $*
}

logDebug () {
  if [ "$DEBUG" == true ]; then
    logMessage "Debug:" $*
  fi
}

logInfo () {
  logMessage "Info:" $*
}
