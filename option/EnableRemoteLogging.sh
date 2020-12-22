#!/bin/bash

# Description:  It enables the switch to send its logs to a remote server.
# Author:       Luciano Sampaio Martins de Souza
# Date:         21-Dec-2020

enableRemoteLogging () {
  logInfo "Enabling Remote Logging."

  #index: The index of the log server. The switch supports 4 log servers at most.
  logIndex=1

  (
    sendEnable
    sendConfig
    sendEnableRemoteLogging "$logIndex" "$IP_REMOTE_LOGGING_SERVER" "$LOG_LEVEL"
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

}
