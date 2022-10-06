#!/bin/bash

# Description:  Scripts to setup the Switch Tplink SFP T1600G-28TS-SG2424.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020
# Usage:        ./setup.sh

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
. lib/FileOwner.sh
. lib/Https.sh
. lib/IP.sh
. lib/Log.sh
. lib/PackageManager.sh
. lib/Service.sh
. lib/SSH.sh
. lib/String.sh
. lib/Telnet.sh
. lib/TFTP.sh
. option/AllSetupScripts.sh
. option/Backup.sh
. option/DeviceDescription.sh
. option/DoSDefend.sh
. option/EEE.sh
. option/FactorySettings.sh
. option/Firmware.sh
. option/HostMachine.sh
. option/HTTP.sh
. option/HTTPS.sh
. option/Interface.sh
. option/IPRouting.sh
. option/JumboSize.sh
. option/LACP.sh
. option/PasswordEncryption.sh
. option/PVID.sh
. option/Reboot.sh
. option/RemoteLogging.sh
. option/RestoreSettingsFromLatestBackup.sh
. option/SDMPreference.sh
. option/SSH.sh
. option/StaticIP.sh
. option/StaticRouting.sh
. option/SystemTimeUsingNTPServer.sh
. option/Telnet.sh
. option/User.sh
. option/Vlan.sh

# Variables
exitOption=0
amountOfOptions=27

userHasProvidedArguments () {
  # 0 True and 1 False
  [ $# -ge 1 ] && return 0 || return 1
}
if (userHasProvidedArguments $*) ; then
  chosenOption=$1
else
  chosenOption=-1
fi

# Methods
sendBreakLine () {
  echo ""
}

runChosenOption () {
  sendBreakLine
  case $1 in
   #0) is the option to exit the application. There is nothing to do here.
    1)
      runAllSetupScripts ;;
    2)
      prepareHostMachine ;;
    3)
      setStaticIP ;;
    4)
      enableSSH ;;
    5)
      enablePasswordEncryption ;;
    6)
      createBotUser ;;
    7)
      setLACP ;;
    8)
      setVlans ;;
    9)
      setPVID ;;
    10)
      setIPRouting ;;
    11)
      setInterfaces ;;
    12)
      setStaticRoutingToDefaultGateway ;;      
    13)
      setSystemTimeUsingNTPServer ;;
    14)
      enableHTTPS ;;
    15)
      disableHTTP ;;
    16)
      setJumboSize ;;
    17)
      enableDoSDefend ;;
    18)
      setDeviceDescription ;;
    19)
      setSDMPreference ;;
    20)
      enableRemoteLogging ;;
    21)
      disableTelnet ;;
    22)
      enableEEE ;;
    23)
      upgradeFirmware ;;
    24)
      backup ;;
    25)
      reboot ;;
    26)
      resetWithFactorySettings ;;
    27)
      restoreSettingsFromLatestBackup ;;
  esac
  sendBreakLine
}

displayMenu() {
  index=0
  echo "Type the number of the option you want to execute. [$index-$1]"
  echo "$((index++)) - Exit."
  echo "$((index++)) - Setup Switch from Zero to Hero!"
  echo "$((index++)) - Prepare Host Machine."
  echo "$((index++)) - Set static IP."
  echo "$((index++)) - Enable SSH."
  echo "$((index++)) - Enable Password Encryption."
  echo "$((index++)) - Create Bot User."
  echo "$((index++)) - Set Link Aggregation Control Protocol."
  echo "$((index++)) - Set Vlans."
  echo "$((index++)) - Set PVID."
  echo "$((index++)) - Set IP Routing."
  echo "$((index++)) - Set Interfaces."
  echo "$((index++)) - Set IPv4 Static Routing to Default Gateway."
  echo "$((index++)) - Set System Time from NTP Server."
  echo "$((index++)) - Enable HTTPS."
  echo "$((index++)) - Disable HTTP."
  echo "$((index++)) - Set Jumbo Size."
  echo "$((index++)) - Enable DoS Defend."
  echo "$((index++)) - Set Device Description."
  echo "$((index++)) - Set SDM Preference."
  echo "$((index++)) - Enable Remote Logging."
  echo "$((index++)) - Disable Telnet."
  echo "$((index++)) - Enable EEE."
  echo "$((index++)) - Upgrade Firmware."
  echo "$((index++)) - Backup."
  echo "$((index++)) - Reboot."
  echo "$((index++)) - Reset with Factory Settings."
  echo "$((index++)) - Restore Settings from Latest Backup."
}

userHasChosenAValidOption() {
  # 0 True and 1 False
  [ $1 -ge 0 ] && [ $1 -le $2 ] && return 0 || return 1
}

getChosenOption () {
  chosenOption=$1
  amountOfOptions=$2

  until userHasChosenAValidOption $chosenOption $amountOfOptions
  do
    displayMenu $amountOfOptions
    read chosenOption
  done

  return $chosenOption
}

userWantsToExit() {
  # 0 True and 1 False
  [ $1 -eq $exitOption ] && return 0 || return 1
}

until userWantsToExit $chosenOption
do  
  getChosenOption $chosenOption $amountOfOptions
  chosenOption=$?

  runChosenOption $chosenOption

  chosenOption=0
done
