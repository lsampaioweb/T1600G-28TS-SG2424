#!/bin/bash

# Description:  It contains the commands that can be sent to the switch.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

sendCommand() {
  # sleep 0.5
  sleep 1
  echo "$1"
  echo -e "\r"
}

sendEnable() {
  sendCommand "enable"
}

sendYes() {
  sendCommand "Y"
}

sendExit() {
  sendCommand "exit"
}
