#!/bin/bash

# Description:  Create the Vlans (Proxmox Hosts and Vms).
# Author:       Luciano Sampaio Martins de Souza
# Date:         11-Feb-2021

setVlans () {
  logInfo "Setting the Vlans."

  (
    sendEnable
    sendConfig
    sendCreateVlan "$PROXMOX_VLAN_ID" "$PROXMOX_VLAN_NAME"
    sendExit
    sendAssignPortToVlan "$PROXMOX_VLAN_ID" "$PROXMOX_VLAN_PORTS"
    sendExit
    sendCreateVlan "$VMS_VLAN_ID" "$VMS_VLAN_NAME"
    sendExit
    sendAssignPortToVlan "$VMS_VLAN_ID" "$VMS_VLAN_PORTS"
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
