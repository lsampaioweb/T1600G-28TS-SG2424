#!/bin/bash

# Description:  It contains scripts related ssh commands.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

runSSH () {
  #( xargs -I {} ) | ssh -T "$1" #> out.txt
  # d "\n" -> Delimiter is a newline.
  # -n 1   -> One element per line.  
  xargs -d "\n" -n 1 | ssh -T "$1" #>> out.txt
}

createSSHKeyPair () {
  logDebug "Creating SSH Key Pair: $1"

  # -N Password
  # -q Quiet
  ssh-keygen -t rsa -b 2048 -f "$1" -N "" -q
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
      echo -e "\tHostKeyAlgorithms +ssh-dss"
      echo -e "\tKexAlgorithms +diffie-hellman-group1-sha1"
      echo -e "\tCiphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc"
      echo -e "\tAddKeysToAgent yes"
      echo -e "\tIdentityFile $SSH_PUBLIC_KEY_PATH_AND_NAME"
    ) | xargs -d "\n" -n 1 >> $file
  fi
}
