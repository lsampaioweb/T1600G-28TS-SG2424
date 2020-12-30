#!/bin/bash

# Description:  It contains the commands that can be sent to the switch.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

sendConfig() {
  sendCommand "config"
}

sendSaveSettings() {
  sendCommand "copy running-config startup-config"
}

sendBackupStartupConfig() {
  sendCommand "copy startup-config tftp ip-address $1 filename $2"
}

sendResetWithFactorySettingsExceptIP() {
  sendCommand "reset except-ip"
}
