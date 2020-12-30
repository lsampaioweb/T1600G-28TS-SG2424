#!/bin/bash

# Description:  Globally configure the size of jumbo frames to 9000.
# Author:       Luciano Sampaio Martins de Souza
# Date:         21-Dec-2020

setJumboSize () {
  logInfo "Setting the size of jumbo frames."

  (
    sendEnable
    sendConfig
    sendSetJumboSize
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
