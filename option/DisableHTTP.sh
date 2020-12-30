#!/bin/bash

# Description:  It disables the HTTP (80) interface.
# Author:       Luciano Sampaio Martins de Souza
# Date:         21-Dec-2020

disableHTTP () {
  logInfo "Disabling HTTP."

  (
    sendEnable
    sendConfig
    sendDisableHTTP
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
