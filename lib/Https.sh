#!/bin/bash

# Description:  It contains scripts that will be used to enable HTTPS.
# Author:       Luciano Sampaio 
# Date:         21-Dec-2020

copyHTTPSCertificateToTFTPFolder () {
  copyFileToTFTPFolder $1 $2
}

copyHTTPSPrivateKeyToTFTPFolder () {
  copyFileToTFTPFolder $1 $2
}
