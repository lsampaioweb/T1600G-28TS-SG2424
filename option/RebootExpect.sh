#!/usr/bin/expect -f

set timeout 10

set USER_BOT [lindex $argv 0]
set DEVICE_IP [lindex $argv 1]

set consoleMsg "T1600G-28TS"
set lineBreak "\r"

spawn ssh $USER_BOT@$DEVICE_IP

expect "${consoleMsg}>" { send "enable${lineBreak}" }
expect "${consoleMsg}#" { send "reboot${lineBreak}" }
expect "Saving current user config before reboot? (Y/N):" { send "Y${lineBreak}" }
expect "This will reboot device. Continue? (Y/N):" { send "Y${lineBreak}" }

interact
