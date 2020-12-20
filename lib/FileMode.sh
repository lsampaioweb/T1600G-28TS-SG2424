#!/bin/bash

# Description:  It contains methods to change file modes or Access Control Lists of files.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

getCurrentFileMode() {
  stat -f %A $1
}

changeFileMode() {
  #$1 - Options
  #$2 - New Mode
  #$3 - Path
  currentMode=$(getCurrentFileMode $3)
  if [ $currentMode -ne $2 ]; then
    logDebug "chmod" $*
    sudo chmod $*
  fi
}
