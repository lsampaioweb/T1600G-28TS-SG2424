#!/bin/bash

# Description:  Set the Static Routing to the Default Gateway.
# Author:       Luciano Sampaio 
# Date:         01-May-2021

setStaticRoutingToDefaultGateway () {
  logInfo "Setting the Static Routing to the Default Gateway."

  (
    sendEnable
    sendConfig

    sendIpRoute "$STATIC_ROUTE_DESTINATION_IP" "$STATIC_ROUTE_SUBNET_MASK" "$STATIC_ROUTE_DEFAULT_GATEWAY_IP" "$STATIC_ROUTE_DEFAULT_GATEWAY_DISTANCE"
    
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
