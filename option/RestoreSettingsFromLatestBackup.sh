#!/bin/bash

# Description:  It restores all settings from the latest Backup.
# Author:       Luciano Sampaio Martins de Souza
# Date:         29-Dec-2020

getLatestBackupFile () {
  # -t Sort by time modified.
  ls -t ${BACKUP_PATH} | head -1
}

restoreSettingsFromLatestBackup () {
  logInfo "Restoring Settings from Backup."

  startTFTPServer

  backupFileName=$(getLatestBackupFile)
  backupPathAndName=${BACKUP_PATH}${backupFileName}

  copyBackupFileToTFTPFolder "$backupPathAndName"

  (
    sendEnable
    sendRestoreSettingsFromLatestBackupStartupConfig "$(getIpAddress)" "$backupFileName"
    sendYes # Reboot with the new config file? (Y/N):
  ) | runSSH $USER_BOT@$DEVICE_IP

  deleteFileFromTFTPFolder "$backupFileName"

  stopTFTPServer

  logInfo "Finished."
}
