#!/bin/bash

# Description:  It reboots the switch. It usually takes around 3 minutes to come back.
# Author:       Luciano Sampaio Martins de Souza
# Date:         29-Dec-2020

reboot () {
  logInfo "Rebooting the switch."

  expect -f option/RebootExpect.sh  "$USER_BOT" "$DEVICE_IP"

  logInfo "Finished."
}
