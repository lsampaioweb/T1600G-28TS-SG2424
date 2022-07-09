#!/bin/bash

# Description:  It runs all setup scripts.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

# Methods
runAllSetupScripts () {
  logInfo "Running All Setup Scripts."

  prepareHostMachine
  setStaticIP
  enableSSH
  enablePasswordEncryption
  createBotUser
  setLACP
  setVlans
  setPVID
  setIPRouting
  setInterfaces
  setStaticRoutingToDefaultGateway
  setSystemTimeUsingNTPServer
  enableHTTPS
  disableHTTP
  setJumboSize
  enableDoSDefend
  setDeviceDescription
  setSDMPreference
  enableRemoteLogging
  disableTelnet
  enableEEE

  # The final step is to create a backup and save it in the control machine.
  backup

  # Some changes will only take affect after the reboot.
  # reboot

  logInfo "Finished."
}
