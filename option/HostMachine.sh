#!/bin/bash

# Description:  Prepare the host machine with all the directories, files and permissions necessary to interact with the switch.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

prepareHostMachine () {
  logInfo "Preparing Host Machine."

  # Install telnet on the host machine because Macs do not come with telnet installed by default.
  installPackage "telnet"
  installPackage "expect"
  installTFTPServer

  createDirectory "backup"
  createDirectory "firmware"

  logInfo "Finished."
}
