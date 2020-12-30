#!/bin/bash

# Description:  It disables the telnet (23) interface.
# Author:       Luciano Sampaio Martins de Souza
# Date:         29-Dec-2020

disableTelnet () {
  logInfo "Disabling Telnet."

  (
    sendEnable
    sendConfig
    sendDisableTelnet
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

}
