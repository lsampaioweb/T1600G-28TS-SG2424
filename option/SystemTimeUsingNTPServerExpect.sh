#!/usr/bin/expect -f

set USER_BOT [lindex $argv 0]
set DEVICE_IP [lindex $argv 1]
set TIME_ZONE [lindex $argv 2]
set PRIMARY_NTP_SERVER [lindex $argv 3]
set SECONDARY_NTP_SERVER [lindex $argv 4]
set NTP_UPDATE_RATE [lindex $argv 5]

set consoleMsg "T1600G-28TS-01"
set lineBreak "\r"

spawn ssh $USER_BOT@$DEVICE_IP

expect "${consoleMsg}>" { send "enable${lineBreak}" }
expect "${consoleMsg}#" { send "config${lineBreak}" }
expect "${consoleMsg}(config)#" { send "system-time ntp $TIME_ZONE $PRIMARY_NTP_SERVER $SECONDARY_NTP_SERVER $NTP_UPDATE_RATE${lineBreak}" }
expect "${consoleMsg}(config)#" { send "end${lineBreak}" }
expect "${consoleMsg}#" { send "exit${lineBreak}" }
expect "${consoleMsg}" { send "exit${lineBreak}" }

interact
