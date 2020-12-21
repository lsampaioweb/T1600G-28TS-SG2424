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

sendEnd() {
  sendCommand "end"
}
