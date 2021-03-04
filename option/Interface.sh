#!/bin/bash

# Description:  Create an interface for a Vlan.
# Author:       Luciano Sampaio Martins de Souza
# Date:         03-Mar-2021

setInterfaces () {
  logInfo "Creating the Interfaces for the Vlans."

  (
    sendEnable
    sendConfig

    for file in $VLAN_PATH_OF_VARIABLES ; do
      # Include file
      . $file

      if ( stringIsNotEmpty "$IP_ADDRESS"); then
        sendInterfaceVlan "$VLAN_ID"
        sendDescription "$VLAN_NAME"
        sendIpAddress "$IP_ADDRESS" "$SUBNET_MASK"
        sendExit
      fi
    done

    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
