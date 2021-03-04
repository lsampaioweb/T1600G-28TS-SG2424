#!/bin/bash

# Description:  Set the PVID of the ports and lag.
# Author:       Luciano Sampaio Martins de Souza
# Date:         03-Mar-2021

setPVID () {
  logInfo "Setting the PVID."

  (
    sendEnable
    sendConfig

    for file in $VLAN_PATH_OF_VARIABLES ; do
      # Include file
      . $file

      if ( stringIsNotEmpty "$PVID_PORTS"); then
        sendInterfaceRangeGigabitEthernet "$PVID_PORTS"
        sendSetPVIDofPort "$VLAN_ID"
        sendExit
      fi

      if ( stringIsNotEmpty "$PVID_LAG_PORTS"); then
        sendInterfaceRangePortChannel "$PVID_LAG_PORTS"
        sendSetPVIDofPort "$VLAN_ID"
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
