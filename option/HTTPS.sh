#!/bin/bash

# Description:  It enables HTTPS interface.
# Author:       Luciano Sampaio Martins de Souza
# Date:         21-Dec-2020

enableHTTPS () {
  logInfo "Enabling HTTPS."

  startTFTPServer

  if ( ! fileExists $HTTPS_CERTIFICATE_PATH_AND_NAME ) || ( ! fileExists $HTTPS_CERTIFICATE_PEM_PATH_AND_NAME ); then
    createHTTPSCertificate "$HTTPS_CERTIFICATE_CONFIG_PATH_AND_NAME" "$HTTPS_CERTIFICATE_PATH_AND_NAME" "$HTTPS_CERTIFICATE_KEY_PATH_AND_NAME" "$HTTPS_CERTIFICATE_PEM_PATH_AND_NAME"

    importHTTPSCertificateIntoKeyChain "$HTTPS_CERTIFICATE_PATH_AND_NAME"
  fi

  copyHTTPSCertificateToTFTPFolder "$HTTPS_CERTIFICATE_PATH_AND_NAME"
  copyHTTPSPemToTFTPFolder "$HTTPS_CERTIFICATE_PEM_PATH_AND_NAME"

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

  deleteFileFromTFTPFolder "$HTTPS_CERTIFICATE"
  deleteFileFromTFTPFolder "$HTTPS_CERTIFICATE_PEM"

  stopTFTPServer

  logInfo "Finished."
}
