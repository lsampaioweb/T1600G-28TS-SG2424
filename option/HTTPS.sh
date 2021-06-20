#!/bin/bash

# Description:  It enables HTTPS interface.
# Author:       Luciano Sampaio 
# Date:         21-Dec-2020

enableHTTPS () {
  logInfo "Enabling HTTPS."

  copyHTTPSCertificateToTFTPFolder "$HTTPS_CERTIFICATE_PATH_AND_NAME" "$HTTPS_CERTIFICATE_SHORT_NAME"
  copyHTTPSPrivateKeyToTFTPFolder "$HTTPS_CERTIFICATE_KEY_PATH_AND_NAME" "$HTTPS_CERTIFICATE_KEY_SHORT_NAME"
  
  startTFTPServer

  ipAddress=$(getIpAddress)
  (
    sendEnable
    sendConfig
    sendEnableHTTPS
    sendDownloadHTTPSCertificate "$ipAddress"
    sendDownloadHTTPSKey "$ipAddress"
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_BOT@$DEVICE_IP

  deleteFileFromTFTPFolder "$HTTPS_CERTIFICATE_SHORT_NAME"
  deleteFileFromTFTPFolder "$HTTPS_CERTIFICATE_KEY_SHORT_NAME"

  stopTFTPServer

  logInfo "Finished."
}
