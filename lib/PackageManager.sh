#!/bin/bash

# Description:  It contains scripts related with packages.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

isPackageInstalled () {
  result=$(brew list --formula | grep $1)

  # 0 True and 1 False
  [ "$result" == "$1" ] && return 0 || return 1
}

packageManager () {
  if [ "$1" == "install" ]; then
    if ( ! isPackageInstalled $2 ); then
      logDebug "Installing: " $2
      brew $1 $2
    fi
  fi
}

installPackage () {
  packageManager "install" "$1"
}
