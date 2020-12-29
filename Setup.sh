#!/bin/bash

# Description:  Scripts to setup the Switch Tplink SFP T1600G-28TS-SG2424.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020
# Usage:        ./Setup.sh

# Dependencies
. Constants.sh
. command/Config.sh
. command/Enable.sh
. command/Management.sh
. lib/Base64.sh
. lib/Credential.sh
. lib/Directory.sh
. lib/File.sh
. lib/FileMode.sh
. lib/Https.sh
. lib/IP.sh
. lib/Log.sh
. lib/PackageManager.sh
. lib/SSH.sh
. lib/Telnet.sh
. lib/TFTP.sh
. option/CreateBotUser.sh
. option/DeviceDescription.sh
. option/DisableHTTP.sh
. option/EnableDoSDefend.sh
. option/EnableEEE.sh
. option/EnableHTTPS.sh
. option/EnablePasswordEncryption.sh
. option/EnableRemoteLogging.sh
. option/EnableSSH.sh
. option/JumboSize.sh
. option/PrepareHostMachine.sh
. option/RunAllSetupScripts.sh
. option/SDMPreference.sh
. option/SystemTimeUsingNTPServer.sh
. option/UpgradeFirmware.sh

# Variables
chosenOption=-1
amountOfOptions=16

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
    5)
      upgradeFirmware ;;
    6)
      enablePasswordEncryption ;;
    7)
      createBotUser ;;
    8)
      setSystemTimeUsingNTPServer ;;
    9)
      enableRemoteLogging ;;
    10)
      enableHTTPS ;;
    11)
      disableHTTP ;;
    12)
      setJumboSize ;;
    13)
      enableDoSDefend ;;
    14)
      setDeviceDescription ;;
    15)
      enableEEE ;;
    16)
      setSDMPreference ;;
  esac
  sendBreakLine
}

displayMenu() {
  echo "Type the number of the option you want to execute. [1-$1]"
  echo " 1 - Exit."
  echo " 2 - Setup Switch from Zero to Hero!"
  echo " 3 - Prepare Host Machine."
  echo " 4 - Enable SSH."
  echo " 5 - Upgrade Firmware."
  echo " 6 - Enable Password Encryption."
  echo " 7 - Create Bot User."
  echo " 8 - Set System Time from NTP Server."
  echo " 9 - Enable Remote Logging."
  echo "10 - Enable HTTPS."
  echo "11 - Disable HTTP."
  echo "12 - Set Jumbo Size."
  echo "13 - Enable DoS Defend."
  echo "14 - Set Device Description."
  echo "15 - Enable EEE."
  echo "16 - Set SDM Preference."
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
