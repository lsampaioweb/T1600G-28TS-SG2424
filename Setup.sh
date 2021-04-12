#!/bin/bash

# Description:  Scripts to setup the Switch Tplink SFP T1600G-28TS-SG2424.
# Author:       Luciano Sampaio 
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
. lib/String.sh
. lib/Telnet.sh
. lib/TFTP.sh
. option/AllSetupScripts.sh
. option/Backup.sh
. option/DeviceDescription.sh
. option/DHCP.sh
. option/DoSDefend.sh
. option/EEE.sh
. option/FactorySettings.sh
. option/Firmware.sh
. option/HostMachine.sh
. option/HTTP.sh
. option/HTTPS.sh
. option/Interface.sh
. option/JumboSize.sh
. option/LACP.sh
. option/PasswordEncryption.sh
. option/PVID.sh
. option/Reboot.sh
. option/RemoteLogging.sh
. option/RestoreSettingsFromLatestBackup.sh
. option/SDMPreference.sh
. option/SSH.sh
. option/SystemTimeUsingNTPServer.sh
. option/Telnet.sh
. option/User.sh
. option/Vlan.sh

# Variables
chosenOption=-1
amountOfOptions=26

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
      setLACP ;;
    16)
      setVlans ;;
    17)
      setPVID ;;
    18)
      setInterfaces ;;
    19)
      setDHCP ;;
    20)
      disableTelnet ;;
    21)
      setSDMPreference ;;
    22)
      upgradeFirmware ;;
    23)
      backup ;;
    24)
      reboot ;;
    25)
      resetWithFactorySettings ;;
    26)
      restoreSettingsFromLatestBackup ;;
  esac
  sendBreakLine
}

displayMenu() {
  index=1
  echo "Type the number of the option you want to execute. [$index-$1]"
  echo "$((index++)) - Exit."
  echo "$((index++)) - Setup Switch from Zero to Hero!"
  echo "$((index++)) - Prepare Host Machine."
  echo "$((index++)) - Enable SSH."
  echo "$((index++)) - Enable Password Encryption."
  echo "$((index++)) - Create Bot User."
  echo "$((index++)) - Set System Time from NTP Server."
  echo "$((index++)) - Enable Remote Logging."
  echo "$((index++)) - Enable HTTPS."
  echo "$((index++)) - Disable HTTP."
  echo "$((index++)) - Set Jumbo Size."
  echo "$((index++)) - Enable DoS Defend."
  echo "$((index++)) - Set Device Description."
  echo "$((index++)) - Enable EEE."
  echo "$((index++)) - Set Link Aggregation Control Protocol."
  echo "$((index++)) - Set Vlans."
  echo "$((index++)) - Set PVID."
  echo "$((index++)) - Set Interfaces."
  echo "$((index++)) - Set DHCP."
  echo "$((index++)) - Disable Telnet."
  echo "$((index++)) - Set SDM Preference."
  echo "$((index++)) - Upgrade Firmware."
  echo "$((index++)) - Backup."
  echo "$((index++)) - Reboot."
  echo "$((index++)) - Reset with Factory Settings."
  echo "$((index++)) - Restore Settings from Latest Backup."
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
