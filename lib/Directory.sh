#!/bin/bash

# Description:  It contains scripts related with directories.
# Author:       Luciano Sampaio Martins de Souza
# Date:         21-Dec-2020

directoryExists () {
  # 0 True and 1 False
  [ -d "$1" ] && return 0 || return 1
}

createDirectory () {
  if ( ! directoryExists $1 ); then
    logDebug "Creating directory: " $1
    mkdir $1
  fi
}
