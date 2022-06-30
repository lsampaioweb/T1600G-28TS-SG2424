#!/bin/bash

# Description:  The DoS (Denial of Service) defend feature provides protection against DoS attacks. With DoS Defend, the switch can analyze specific fields of the IP packets, distinguish the malicious DoS attack packets and discard them directly. In addition, DoS Defend can limit the transmission rate of legal packets.
# Author:       Luciano Sampaio 
# Date:         29-Dec-2020

enableDoSDefend () {
  # As the option was dropping NFS packages, I had to disable the DOS defend function. 
  # The problematic rule was "port-less-1024", but I don't know if other rules are blocking other things.

  logInfo "Enabling DoS Defend."

  # (
  #   sendEnable
  #   sendConfig
  #   sendEnableDoSDefend
  #   sendSetDoSDefendTypes "land" "scan-synfin" "xma-scan" "null-scan" "port-less-1024" "blat" "ping-flood" "syn-flood" "win-nuke" "ping-of-death" "smurf"
  #   sendEnd
  #   sendSaveSettings
  #   sendExit
  #   sendExit
  # ) | runSSH $USER_BOT@$DEVICE_IP

  logInfo "Finished."
}
