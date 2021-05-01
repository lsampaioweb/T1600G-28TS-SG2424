#!/bin/bash

# Description:  It runs all setup scripts.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

# Methods
runAllSetupScripts () {
  logInfo "Running All Setup Scripts."

  prepareHostMachine
  setStaticIP
  setStaticRoutingToDefaultGateway
  enableSSH
  enablePasswordEncryption
  createBotUser
  setSystemTimeUsingNTPServer
  enableRemoteLogging
  enableHTTPS
  disableHTTP
  setJumboSize
  enableDoSDefend
  setDeviceDescription
  enableEEE
  setLACP
  setVlans
  setPVID
  setInterfaces
  setDHCP
  disableTelnet
  setSDMPreference

  # The final step is to create a backup and save it in the control machine.
  backup

  # Some changes will only take affect after the reboot.
  reboot

  logInfo "Finished."
}
