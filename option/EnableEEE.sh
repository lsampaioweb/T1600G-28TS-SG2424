#!/bin/bash

# Description:  Enable EEE (Energy Efficient Ethernet) on the ports.
# Author:       Luciano Sampaio Martins de Souza
# Date:         29-Dec-2020

enableEEE () {
  logInfo "Enabling EEE."

  expect -f option/EnableEEEExpect.sh  "$USER_BOT" "$DEVICE_IP"

  logInfo "Finished."
}
