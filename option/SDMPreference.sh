#!/bin/bash

# Description:  SDM (Switch Database Management) Template is used to distribute system resources to different applications such as ACL and ARP Detection.
# Author:       Luciano Sampaio Martins de Souza
# Date:         29-Dec-2020

setSDMPreference () {
  logInfo "Setting the SDM Preference."

  (
    sendEnable
    sendConfig
    sendSetSDMPreference
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
