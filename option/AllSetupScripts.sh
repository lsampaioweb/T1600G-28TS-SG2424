#!/bin/bash

# Description:  It runs all setup scripts.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

# Methods
runAllSetupScripts () {
  logInfo "Running All Setup Scripts."

  prepareHostMachine
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
  setSDMPreference
  setVlans
  disableTelnet

  # The final step is to create a backup and save it in the control machine.
  backup

  # Some changes will only take affect after the reboot.
  reboot

  logInfo "Finished."
}
