#!/bin/bash

# Description:  It retrieves or saves passwords from and to the keychain.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

getAdminPasswordFromKeyChain() {
  getPassword "$USER" "$USER_ADMIN_KEYCHAIN"
}

getPassword() {
  security find-generic-password -a "$1" -s "$2" -w
}
