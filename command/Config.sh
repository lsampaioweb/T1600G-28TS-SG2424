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

sendEnableRemoteLogging() {
  sendCommand "logging host index $1 $2 $3"
}

sendEnableHTTPS() {
  sendCommand "ip http secure-server"
}

sendDownloadHTTPSCertificate() {
  sendCommand "ip http secure-server download certificate $HTTPS_CERTIFICATE ip-address $1"
}

sendDownloadHTTPSKey() {
  sendCommand "ip http secure-server download key $HTTPS_CERTIFICATE_PEM ip-address $1"
}

sendDisableHTTP() {
  sendCommand "no ip http server"
}

sendSetJumboSize() {
  sendCommand "jumbo-size $SIZE_OF_JUMBO_FRAME"
}

sendEnableDoSDefend() {
  sendCommand "ip dos-prevent"
}

sendSetDoSDefendTypes() {
  for i in $@ ; do
    sendCommand "ip dos-prevent type $i"
  done
}

sendSetDeviceDescription() {
  sendCommand "hostname $DEVICE_NAME"
  sendCommand "location $DEVICE_LOCATION"
  sendCommand "contact-info $(decodeTextFromBase64 $CONTACT_INFO)"
}

sendEnd() {
  sendCommand "end"
}
