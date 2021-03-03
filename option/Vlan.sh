#!/bin/bash

# Description:  Create the Vlans (Proxmox Hosts and Vms).
# Author:       Luciano Sampaio Martins de Souza
# Date:         11-Feb-2021

setVlans () {
  logInfo "Setting the Vlans."

  (
    sendEnable
    sendConfig
    for file in $VLAN_PATH_OF_VARIABLES ; do
      # Include file
      . $file

      sendCreateVlan "$VLAN_ID" "$VLAN_NAME"
      sendExit
      if [ ! -z "$UNTAGGED_PORTS" ]; then
        sendAssignPortToVlanUntagged "$VLAN_ID" "$UNTAGGED_PORTS"
      fi

      if [ ! -z "$TAGGED_PORTS" ]; then
        sendAssignPortToVlanTagged "$VLAN_ID" "$TAGGED_PORTS"
      fi

      if [ ! -z "$UNTAGGED_LAGS" ]; then
        sendAssignLAGToVlanUntagged "$VLAN_ID" "$UNTAGGED_LAGS"
      fi

      if [ ! -z "$TAGGED_LAGS" ]; then
        sendAssignLAGToVlanTagged "$VLAN_ID" "$TAGGED_LAGS"
      fi

      sendExit
    done
    sendEnd
    sendSaveSettings
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
