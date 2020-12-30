#!/bin/bash

# Description:  Set the device description.
# Author:       Luciano Sampaio Martins de Souza
# Date:         29-Dec-2020

setDeviceDescription () {
  logInfo "Setting the Device Description."

  (
    sendEnable
    sendConfig
    sendSetDeviceDescription
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
