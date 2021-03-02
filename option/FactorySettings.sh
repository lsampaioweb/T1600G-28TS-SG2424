#!/bin/bash

# Description:  Reset all configurations (except the ip) to the factory settings.
# Author:       Luciano Sampaio Martins de Souza
# Date:         29-Dec-2020

resetWithFactorySettings () {
  logInfo "Reseting Switch with Factory Settings."

  (
    sendEnable
    sendResetWithFactorySettingsExceptIP
    sendYes
    sendEnd
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

}
