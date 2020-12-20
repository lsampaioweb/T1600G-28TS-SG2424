#!/bin/bash

# Description:  Scripts to setup the Switch Tplink SFP T1600G-28TS SG2424.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020
# Usage:        ./Setup.sh

# Dependencies
. lib/Log.sh
. option/RunAllSetupScripts.sh

# Variables
chosenOption=-1
amountOfOptions=2

# Methods
sendBreakLine () {
  echo ""
}

runChosenOption () {
  sendBreakLine
  case $1 in
   #1) is the option to exit the application. There is nothing to do here.
    2)
      runAllSetupScripts ;;
  esac
  sendBreakLine
}

displayMenu() {
  echo "Type the number of the option you want to execute. [1-$1]"
  echo " 1 - Exit."
  echo " 2 - Setup Switch from Zero to Hero!"
}

userHasChosenAValidOption() {
  # 0 True and 1 False
  [ $1 -ge 1 ] && [ $1 -le $2 ] && return 0 || return 1
}

getChosenOption () {
  chosenOption=-1
  amountOfOptions=$1

  until userHasChosenAValidOption $chosenOption $amountOfOptions
  do
    displayMenu $amountOfOptions
    read chosenOption
  done

  return $chosenOption
}

userWantsToExit() {
  # 0 True and 1 False
  [ $1 -eq 1 ] && return 0 || return 1
}

until userWantsToExit $chosenOption
do
  getChosenOption $amountOfOptions
  chosenOption=$?

  runChosenOption $chosenOption
done
