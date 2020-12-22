#!/bin/bash

# Description:  It contains scripts that will be used to enable HTTPS.
# Author:       Luciano Sampaio Martins de Souza
# Date:         21-Dec-2020

createHTTPSCertificate () {
  logDebug "Creating HTTPS Certificate: $2"

  days="365"
  newkey="rsa:2048"
  config=$1
  output=$2
  rsaInput=$3
  rsaOutput=$4

  openssl req -x509 -nodes -days $days -newkey $newkey -config $config -out $output -keyout $rsaInput

  # Convert from PEM to RSA format.
  openssl rsa -in $rsaInput -out $rsaOutput
}

copyHTTPSCertificateToTFTPFolder () {
  copyFileToTFTPFolder $1
}

copyHTTPSPemToTFTPFolder () {
  copyFileToTFTPFolder $1
}
