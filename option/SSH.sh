#!/bin/bash

# Description:  It enables ssh connection.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

enableSSH () {
  logInfo "Enabling SSH."

  startTFTPServer

  if ( ! fileExists $SSH_PUBLIC_KEY_PATH_AND_FULLNAME ); then
    createSSHKeyPair $SSH_PUBLIC_KEY_PATH_AND_NAME
  fi

  copySSHKeyToTFTPFolder $SSH_PUBLIC_KEY_PATH_AND_FULLNAME

  if ( ! fileExists $SSH_CONFIG_FILE_PATH_AND_FULLNAME ); then
    createSSHConfigFile $SSH_CONFIG_FILE_PATH_AND_FULLNAME
  else
    appendSSHConfigInfo $SSH_CONFIG_FILE_PATH_AND_FULLNAME
  fi

  (
    sendCommand "$USER_ADMIN"
    sendCommand "$(getAdminPasswordFromKeyChain)"
    sendEnable
    sendConfig
    sendEnableSSHServer
    sendDownloadSSHPublicKey "$(getIpAddress)"
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runTelnet $DEVICE_IP

  stopTFTPServer

  logInfo "Finished."
}
