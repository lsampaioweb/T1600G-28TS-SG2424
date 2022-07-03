#!/bin/bash

# Description:  Enable the IPv4 routing function on the specified Layer 3 interface.
# Author:       Luciano Sampaio 
# Date:         11-Aug-2021

setIPRouting () {
  logInfo "Enable IPv4 routing."

  (
    sendEnable
    sendConfig
    sendIPv4Routing
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
