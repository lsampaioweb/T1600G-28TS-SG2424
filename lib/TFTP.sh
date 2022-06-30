#!/bin/bash

# Description:  It contains methods related TFTP (Trivial File Transfer Protocol) commands.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020
# Links:        https://linuxhint.com/install_tftp_server_ubuntu/

installTFTPServer () {
  installPackage "$TFTP_SERVICE_NAME"
  
  tftp_parent_folder=$(echo $TFTP_DIRECTORY | cut -d "/" -f -2)
  changeFileOwner "-R" "$TFTP_USER_GROUP" "$tftp_parent_folder"

  addTFTPConfigFile "$TFTP_CONFIG_DIRECTORY"
}

addTFTPConfigFile () {
  file=$1
  textToSearch="TFTP_OPTIONS=\"--secure --create -4\""
  tftp_username=$(echo $TFTP_USER_GROUP | cut -d ":" -f -1)

  if ( ! textExistsInFile "$file" "$textToSearch"); then
    logDebug "Creating config file: $TFTP_CONFIG_DIRECTORY"

    (
      echo "# $TFTP_CONFIG_DIRECTORY"
      echo ""
      echo "TFTP_USERNAME=\"$tftp_username\""
      echo "TFTP_DIRECTORY=\"$TFTP_DIRECTORY\""
      echo "TFTP_ADDRESS=\":69\""
      echo "TFTP_OPTIONS=\"--secure --create -4\""
    ) | xargs -d "\n" -n 1 | sudo tee $file > /dev/null
    # To avoid printing data back to the console, redirect the output to /dev/null.
  fi
}

startTFTPServer () {
  logInfo "Starting TFTP Server."

  changeFileMode "-R" 777 "$TFTP_DIRECTORY"

  startService "$TFTP_SERVICE_NAME"
}

stopTFTPServer () {
  logInfo "Stopping TFTP Server."

  stopService "$TFTP_SERVICE_NAME"

  changeFileMode "-R" 400 "$TFTP_DIRECTORY"
}

copyFileToTFTPFolder () {
  logDebug "Copying file: $1 to ${TFTP_DIRECTORY}${2}"

  sudo cp -p "$1" "${TFTP_DIRECTORY}${2}"
}

copyFileFromTFTPFolder () {
  logDebug "Copying file: ${TFTP_DIRECTORY}${1} to $2"

  sudo cp -p "${TFTP_DIRECTORY}${1}" "$2"
}

deleteFileFromTFTPFolder () {
  logDebug "Deleting file: ${TFTP_DIRECTORY}${1}"

  sudo rm "${TFTP_DIRECTORY}${1}"
}
