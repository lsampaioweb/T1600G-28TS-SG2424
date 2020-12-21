#!/bin/bash

# Description:  It contains the commands that can be sent to the switch.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

sendEnableSSHServer() {
  sendCommand "ip ssh server"
}

sendDownloadSSHPublicKey() {
  sendCommand "ip ssh download $SSH_VERSION $SSH_PUBLIC_KEY_FULLNAME ip-address $1"
}

sendEnablePasswordEncryption() {
  sendCommand "service password-encryption"
}

sendDeleteUser() {
  sendCommand "no user name $1"
}

sendCreateUser() {
  sendDeleteUser "$1" # Delete the user if he/she already exists.
  sendCommand "user name $1 privilege $2 secret 0 $3"
}

sendEnd() {
  sendCommand "end"
}
