#!/usr/bin/expect -f

set USER_BOT [lindex $argv 0]
set DEVICE_IP [lindex $argv 1]
set EEE_INTERFACES [lindex $argv 2]
set EEE_LACPS [lindex $argv 3]

set consoleMsg "T1600G-28TS"
set lineBreak "\r"

spawn ssh $USER_BOT@$DEVICE_IP

expect "${consoleMsg}>" { send "enable${lineBreak}" }
expect "${consoleMsg}#" { send "config${lineBreak}" }

# Interfaces.
expect "${consoleMsg}(config)#" { send "interface range gigabitEthernet ${EEE_INTERFACES}${lineBreak}" }
expect "${consoleMsg}(config-if-range)#" { send "eee${lineBreak}" }
expect "${consoleMsg}(config-if-range)#" { send "exit${lineBreak}" }

# LACPs.
expect "${consoleMsg}(config)#" { send "interface range port-channel ${EEE_LACPS}${lineBreak}" }
expect "${consoleMsg}(config-if-range)#" { send "eee${lineBreak}" }
expect "${consoleMsg}(config-if-range)#" { send "end${lineBreak}" }

expect "${consoleMsg}#" { send "copy running-config startup-config${lineBreak}" }
expect "${consoleMsg}#" { send "exit${lineBreak}" }
expect "${consoleMsg}" { send "exit${lineBreak}" }

interact
