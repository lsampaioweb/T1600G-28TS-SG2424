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
. option/Backup.sh
. option/CreateBotUser.sh
. option/DeviceDescription.sh
. option/DisableHTTP.sh
. option/DisableTelnet.sh
. option/EnableDoSDefend.sh
. option/EnableEEE.sh
. option/EnableHTTPS.sh
. option/EnablePasswordEncryption.sh
. option/EnableRemoteLogging.sh
. option/EnableSSH.sh
. option/JumboSize.sh
. option/PrepareHostMachine.sh
. option/Reboot.sh
. option/ResetWithFactorySettings.sh
. option/RestoreSettingsFromLatestBackup.sh
. option/RunAllSetupScripts.sh
. option/SDMPreference.sh
. option/SystemTimeUsingNTPServer.sh
. option/UpgradeFirmware.sh

# Variables
chosenOption=-1
amountOfOptions=21

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
      enablePasswordEncryption ;;
    6)
      createBotUser ;;
    7)
      setSystemTimeUsingNTPServer ;;
    8)
      enableRemoteLogging ;;
    9)
      enableHTTPS ;;
    10)
      disableHTTP ;;
    11)
      setJumboSize ;;
    12)
      enableDoSDefend ;;
    13)
      setDeviceDescription ;;
    14)
      enableEEE ;;
    15)
      setSDMPreference ;;
    16)
      disableTelnet ;;
    17)
      upgradeFirmware ;;
    18)
      backup ;;
    19)
      reboot ;;
    20)
      resetWithFactorySettings ;;
    21)
      restoreSettingsFromLatestBackup ;;
  esac
  sendBreakLine
}

displayMenu() {
  echo "Type the number of the option you want to execute. [1-$1]"
  echo " 1 - Exit."
  echo " 2 - Setup Switch from Zero to Hero!"
  echo " 3 - Prepare Host Machine."
  echo " 4 - Enable SSH."
  echo " 5 - Enable Password Encryption."
  echo " 6 - Create Bot User."
  echo " 7 - Set System Time from NTP Server."
  echo " 8 - Enable Remote Logging."
  echo " 9 - Enable HTTPS."
  echo "10 - Disable HTTP."
  echo "11 - Set Jumbo Size."
  echo "12 - Enable DoS Defend."
  echo "13 - Set Device Description."
  echo "14 - Enable EEE."
  echo "15 - Set SDM Preference."
  echo "16 - Disable Telnet."
  echo "17 - Upgrade Firmware."
  echo "18 - Backup."
  echo "19 - Reboot."
  echo "20 - Reset with Factory Settings."
  echo "21 - Restore Settings from Latest Backup."
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
