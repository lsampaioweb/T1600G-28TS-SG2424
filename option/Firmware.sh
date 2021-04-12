#!/bin/bash

# Description:  Upgrade the switch’s firmware via TFTP server.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

upgradeFirmware () {
  logInfo "Upgrading Firmware."

  startTFTPServer

  firmwareFile=${FIRMWARE_PATH}${FIRMWARE_FILE_NAME_BIN}
  firmwareZipFile=${FIRMWARE_PATH}${FIRMWARE_FILE_NAME_ZIP}

  if ( ! fileExists $firmwareFile ); then

    if ( ! fileExists $firmwareZipFile ); then
      curl -L -o "$firmwareZipFile" "$FIRMWARE_URL"
    fi

    unzip "${firmwareZipFile}" "*.bin" "-d" "${FIRMWARE_PATH}"

    mv ${FIRMWARE_PATH}*.bin "$firmwareFile"
  fi

  copyFileToTFTPFolder "$firmwareFile"

  ipAddress=$(getIpAddress)

  expect -f option/FirmwareExpect.sh "$USER_ADMIN" "$DEVICE_IP" "$ipAddress" "$FIRMWARE_FILE_NAME_BIN"

  # Delete files that will not be used anymore.
  deleteFileFromTFTPFolder "$FIRMWARE_FILE_NAME_BIN"
  deleteFile "${firmwareZipFile}"

  stopTFTPServer

  logInfo "Finished."
}
