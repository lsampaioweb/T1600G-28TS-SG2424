#!/bin/bash

# Description:  Set the System Time using NTP Servers.
# Author:       Luciano Sampaio Martins de Souza
# Date:         21-Dec-2020

setSystemTimeUsingNTPServer () {
  logInfo "Setting the System Time using NTP Servers."

  expect -f option/SystemTimeUsingNTPServerExpect.sh  "$USER_BOT" "$DEVICE_IP" "$TIME_ZONE" "$PRIMARY_NTP_SERVER" "$SECONDARY_NTP_SERVER" "$NTP_UPDATE_RATE"

}
