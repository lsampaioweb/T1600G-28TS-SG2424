#!/bin/bash

# Description:  Set the PVID of the ports and lag.
# Author:       Luciano Sampaio Martins de Souza
# Date:         03-Mar-2021

setPVID () {
  logInfo "Setting the PVID."

  (
    sendEnable
    sendConfig

    for file in $PVID_PATH_OF_PORT_VARIABLES ; do
      # Include file
      . $file

      sendInterfaceRangeGigabitEthernet "$PORTS"
      sendSetPVIDofPort "$VLAN_ID"
      sendExit
    done

    for file in $PVID_PATH_OF_LAG_VARIABLES ; do
      # Include file
      . $file

      sendInterfaceRangePortChannel "$PORTS"
      sendSetPVIDofPort "$VLAN_ID"
      sendExit
    done

    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
