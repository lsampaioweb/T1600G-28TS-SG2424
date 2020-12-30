#!/bin/bash

# Description:  The command is used to encrypt the password when the password is defined or when the configuration is written.
# Author:       Luciano Sampaio Martins de Souza
# Date:         21-Dec-2020

enablePasswordEncryption () {
  logInfo "Enabling Password Encryption Service."

  (
    sendEnable
    sendConfig
    sendEnablePasswordEncryption
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_ADMIN@$DEVICE_IP

  logInfo "Finished."
}
