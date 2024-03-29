#!/usr/bin/expect -f

set timeout 150

set USER_ADMIN [lindex $argv 0]
set DEVICE_IP [lindex $argv 1]
set ipAddress [lindex $argv 2]
set filename [lindex $argv 3]

set consoleMsg "T1600G-28TS"
set lineBreak "\r"

spawn ssh $USER_ADMIN@$DEVICE_IP

expect "${consoleMsg}>" { send "enable${lineBreak}" }
expect "${consoleMsg}#" { send "firmware upgrade ip-address $ipAddress filename ${filename}${lineBreak}" }
expect "It will only upgrade the backup image. Continue? (Y/N):" { send "Y${lineBreak}" }
expect "Reboot with the backup image? (Y/N):" { send "Y${lineBreak}" }
interact
