#!/bin/bash

# Description:  Create the Vlans (Proxmox Hosts and Vms).
# Author:       Luciano Sampaio 
# Date:         11-Feb-2021

setVlans () {
  logInfo "Setting the Vlans."

  (
    sendEnable
    sendConfig

    for file in $VLAN_PATH_OF_VARIABLES_WITH_FILTER ; do
      # Include file
      . $file

      sendCreateVlan "$VLAN_ID" "$VLAN_NAME"
      sendExit
      if ( stringIsNotEmpty "$UNTAGGED_PORTS"); then
        sendAssignPortToVlanUntagged "$VLAN_ID" "$UNTAGGED_PORTS"
        sendExit
      fi

      if ( stringIsNotEmpty "$TAGGED_PORTS"); then
        sendAssignPortToVlanTagged "$VLAN_ID" "$TAGGED_PORTS"
        sendExit
      fi

      if ( stringIsNotEmpty "$UNTAGGED_LAG"); then
        sendAssignLAGToVlanUntagged "$VLAN_ID" "$UNTAGGED_LAG"
        sendExit
      fi

      if ( stringIsNotEmpty "$TAGGED_LAG"); then
        sendAssignLAGToVlanTagged "$VLAN_ID" "$TAGGED_LAG"
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
