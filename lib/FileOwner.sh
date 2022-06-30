#!/bin/bash

# Description:  It contains methods to change file owner of files.
# Author:       Luciano Sampaio 
# Date:         27-Jun-2022

getCurrentFileOwner() {
  stat -c "%U:%G" $1
}

changeFileOwner() {
  #$1 - Options
  #$2 - user:group
  #$3 - path
  currentOwner=$(getCurrentFileOwner $3)
  if [ $currentOwner != "$2" ]; then
    logDebug "chown" $*
    sudo chown $*
  fi
}
