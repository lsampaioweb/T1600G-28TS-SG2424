#!/bin/bash

# Description:  It contains methods related TFTP commands.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020
# Links:        https://www.wirelessphreak.com/2016/07/using-built-in-tftp-server-on-os-x-el.html

tftpPath="/System/Library/LaunchDaemons/tftp.plist"

startTFTPServer () {
  logInfo "Starting TFTP Server."

  changeFileMode "-R" 777 "$TFTP_DIRECTORY"

  sudo launchctl load -F "$tftpPath" && \
  sudo launchctl start "com.apple.tftpd"
}

stopTFTPServer () {
  logInfo "Stopping TFTP Server."

  sudo launchctl unload -F "$tftpPath"

  changeFileMode "-R" 766 "$TFTP_DIRECTORY"
}

copyFileToTFTPFolder () {
  logDebug "Copying file: $1 to $TFTP_DIRECTORY"

  sudo cp -p "$1" "$TFTP_DIRECTORY"
}

copyFileFromTFTPFolder () {
  logDebug "Copying file: ${TFTP_DIRECTORY}${1} to $2"

  sudo cp -p "${TFTP_DIRECTORY}${1}" "$2"
}

deleteFileFromTFTPFolder () {
  logDebug "Deleting file: ${TFTP_DIRECTORY}${1}"

  sudo rm "${TFTP_DIRECTORY}${1}"
}
