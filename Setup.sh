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
. option/StaticIP.sh
. option/StaticRouting.sh
. option/SystemTimeUsingNTPServer.sh
. option/Telnet.sh
. option/User.sh
. option/Vlan.sh

# Variables
chosenOption=-1
amountOfOptions=28

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
      setStaticIP ;;
    5)
      setStaticRoutingToDefaultGateway ;;
    6)
      enableSSH ;;
    7)
      enablePasswordEncryption ;;
    8)
      createBotUser ;;
    9)
      setSystemTimeUsingNTPServer ;;
    10)
      enableRemoteLogging ;;
    11)
      enableHTTPS ;;
    12)
      disableHTTP ;;
    13)
      setJumboSize ;;
    14)
      enableDoSDefend ;;
    15)
      setDeviceDescription ;;
    16)
      enableEEE ;;
    17)
      setLACP ;;
    18)
      setVlans ;;
    19)
      setPVID ;;
    20)
      setInterfaces ;;
    21)
      setDHCP ;;
    22)
      disableTelnet ;;
    23)
      setSDMPreference ;;
    24)
      upgradeFirmware ;;
    25)
      backup ;;
    26)
      reboot ;;
    27)
      resetWithFactorySettings ;;
    28)
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
  echo "$((index++)) - Change from DHCP to static IP."
  echo "$((index++)) - Set IPv4 Static Routing to Default Gateway."
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
