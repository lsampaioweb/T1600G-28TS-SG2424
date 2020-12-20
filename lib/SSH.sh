#!/bin/bash

# Description:  It contains scripts related ssh commands.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

createSSHKeyPair () {
  logDebug "Creating SSH Key Pair: $1"

  # -N Password
  # -q Quiet
  ssh-keygen -t rsa -b 4096 -f "$1" -N "" -q
}

copySSHKeyToTFTPFolder () {
  copyFileToTFTPFolder $1
}

createSSHConfigFile () {
  logDebug "Creating SSH Config File: $1"

  touch $1

  appendSSHConfigInfo $1
}

appendSSHConfigInfo () {
  file=$1
  textToSearch="# Specific Settings for $DEVICE_IP"

  if ( ! textExistsInFile "$file" "$textToSearch"); then
    logDebug "Appending Specific Settings for: $DEVICE_IP"

    (
      echo "$textToSearch"
      echo "HostName $DEVICE_IP"
      echo "HostKeyAlgorithms +ssh-dss"
      echo "KexAlgorithms +diffie-hellman-group1-sha1"
      echo "Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc"
      echo "UseKeychain yes"
      echo "AddKeysToAgent yes"
      echo "IdentityFile $SSH_PUBLIC_KEY_PATH_AND_NAME"
    ) | xargs -I {} >> $file
  fi
}
