#!/bin/bash

# Description:  Change from DHCP to static IP.
# Author:       Luciano Sampaio 
# Date:         01-May-2021

setStaticIP () {
  logInfo "Setting the static IP."

  echo "Type the current IP address:"
  read currentIP

  (
    sendCommand "$USER_ADMIN"
    sendCommand "$(getAdminPasswordFromVault)"
    sendEnable
    sendConfig

    # Include file
    . "$VLAN_PATH_OF_VARIABLES/1.sh"

    sendInterfaceVlan "$VLAN_ID"
    sendDescription "$VLAN_NAME"
    sendIpAddress "$IP_ADDRESS" "$SUBNET_MASK"
    sendExit

    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runTelnet "$currentIP"

  logInfo "Finished."
}
