#!/bin/bash

# Description:  Scripts to setup the Switch Tplink SFP T1600G-28TS SG2424.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020
# Usage:        ./Setup.sh

# Dependencies
. Constants.sh
. command/Config.sh
. command/Enable.sh
. command/Management.sh
. lib/Credential.sh
. lib/File.sh
. lib/FileMode.sh
. lib/IP.sh
. lib/Log.sh
. lib/PackageManager.sh
. lib/SSH.sh
. lib/Telnet.sh
. lib/TFTP.sh
. option/EnableSSH.sh
. option/PrepareHostMachine.sh
. option/RunAllSetupScripts.sh

# Variables
chosenOption=-1
amountOfOptions=4

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
    3)
      prepareHostMachine ;;
    4)
      enableSSH ;;
  esac
  sendBreakLine
}

displayMenu() {
  echo "Type the number of the option you want to execute. [1-$1]"
  echo " 1 - Exit."
  echo " 2 - Setup Switch from Zero to Hero!"
  echo " 3 - Prepare Host Machine."
  echo " 4 - Enable SSH."
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
