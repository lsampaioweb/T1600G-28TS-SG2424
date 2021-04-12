#!/bin/bash

# Description:  It creates a backup of the switches configuration.
# Author:       Luciano Sampaio 
# Date:         29-Dec-2020

getDateTimeForName () {
  date "+%Y-%m-%d-%H-%M-%S"
}

createEmptyBackupFile () {
  logDebug "Creating file: $1"

  touch "$1"

  # It is necessary so the switch can edit the file.
  changeFileMode "" 666 "$1"
}

copyBackupFileToTFTPFolder () {
  copyFileToTFTPFolder "$1"
}

copyBackupFileFromTFTPFolder () {
  copyFileFromTFTPFolder "$1" "$2"
}

backup () {
  logInfo "Backing up Current Configuration."

  startTFTPServer

  dateTime=$(getDateTimeForName)
  backupFileName="${BACKUP_NAME}${dateTime}${BACKUP_EXTENSION}"
  backupPathAndName="${BACKUP_PATH}${backupFileName}"

  createEmptyBackupFile "$backupPathAndName"

  copyBackupFileToTFTPFolder "$backupPathAndName"

  (
    sendEnable
    sendBackupStartupConfig "$(getIpAddress)" "$backupFileName"
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  copyBackupFileFromTFTPFolder "$backupFileName" "$backupPathAndName"

  deleteFileFromTFTPFolder "$backupFileName"

  stopTFTPServer

  logInfo "Finished."

}
