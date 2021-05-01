#!/usr/bin/expect -f

set USER_BOT [lindex $argv 0]
set DEVICE_IP [lindex $argv 1]

set consoleMsg "T1600G-28TS"
set lineBreak "\r"

spawn ssh $USER_BOT@$DEVICE_IP

expect "${consoleMsg}>" { send "enable${lineBreak}" }
expect "${consoleMsg}#" { send "config${lineBreak}" }
expect "${consoleMsg}(config)#" { send "interface range gigabitEthernet 1/0/1-24${lineBreak}" }
expect "${consoleMsg}(config-if-range)#" { send "eee${lineBreak}" }
expect "${consoleMsg}(config-if-range)#" { send "end${lineBreak}" }
expect "${consoleMsg}#" { send "copy running-config startup-config${lineBreak}" }
expect "${consoleMsg}#" { send "exit${lineBreak}" }
expect "${consoleMsg}" { send "exit${lineBreak}" }

interact
