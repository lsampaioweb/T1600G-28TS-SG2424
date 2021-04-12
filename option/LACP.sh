#!/bin/bash

# Description:  Set the Link Aggregation Control Protocol (LACP).
# Author:       Luciano Sampaio 
# Date:         03-Mar-2021

setLACPLoadBalancingAlgorithm () {
  (
    sendEnable
    sendConfig
    sendLACPLoadBalancingAlgorithm "$LACP_LOAD_BALANCE"
    sendEnd
    sendSaveSettings
  ) | runSSH $USER_BOT@$DEVICE_IP
}

setLACPGroups () {
  (
    sendEnable
    sendConfig
    for file in $LACP_PATH_OF_GROUPS_VARIABLES ; do
      # Include file
      . $file

      sendInterfaceRangeGigabitEthernet "$PORTS"
      sendLACPGroupModePassive "$GROUP_ID"
      sendLACPPortPriority "$PORT_PRIORITY"
      sendExit
    done
    sendEnd
    sendSaveSettings
  ) | runSSH $USER_BOT@$DEVICE_IP
}

setLACP () {
  logInfo "Setting the Link Aggregation Control Protocol (LACP)."

  setLACPLoadBalancingAlgorithm

  setLACPGroups

  logInfo "Finished."
}
