#!/bin/bash

# Description:  It Runs all setup scripts.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

# Methods
runAllSetupScripts () {
  logInfo "Running All Setup Scripts."

  prepareHostMachine
  enableSSH
  upgradeFirmware
  enablePasswordEncryption
  createBotUser
  setSystemTimeUsingNTPServer
  enableRemoteLogging
  enableHTTPS
  disableHTTP

  logInfo "Finished."
}
