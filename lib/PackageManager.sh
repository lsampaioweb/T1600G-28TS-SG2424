#!/bin/bash

# Description:  It contains scripts related with packages.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

isPackageInstalled () {
  result=$(apt -qq list --installed $1 2>/dev/null | cut -d'/' -f1)

  # 0 True and 1 False
  [ "$result" == "$1" ] && return 0 || return 1
}

packageManager () {
  if [ "$1" == "install" ]; then
    if ( ! isPackageInstalled $2 ); then
      logDebug "Installing: " $2
      sudo apt $1 $2 -y
    fi
  fi
}

installPackage () {
  packageManager "install" "$1"
}
