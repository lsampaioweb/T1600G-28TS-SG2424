#!/bin/bash

# Description:  Enable DHCP and create the pools.
# Author:       Luciano Sampaio Martins de Souza
# Date:         03-Mar-2021

enableDHCP () {
  logInfo "Enabling DHCP."

  (
    sendEnable
    sendConfig
    sendEnableDHCP
    sendEnd
    sendSaveSettings
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}

createDHCPPools () {
  logInfo "Creating the DHCP pools."

  (
    sendEnable
    sendConfig

    for file in $VLAN_PATH_OF_VARIABLES ; do
      # Include file
      . $file

      if ( stringIsNotEmpty "$NETWORK_ADDRESS"); then
        sendDHCPPoolName "VLAN$VLAN_ID"
        sendDHCPPoolIpAndNetwork "$NETWORK_ADDRESS" "$SUBNET_MASK"
        sendDHCPPoolGateway "$DEFAULT_GATEWAY"
        sendDHCPPoolDNS "$DNS_SERVER"
        sendExit

        sendDHCPExcludedAddress "$EXCLUDED_ADDRESS"
      fi
    done

    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}

setDHCP () {
  enableDHCP

  createDHCPPools
}
