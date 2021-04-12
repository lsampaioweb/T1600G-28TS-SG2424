#!/bin/bash

# Description:  It retrieves or saves passwords from and to the keychain.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

getAdminPasswordFromKeyChain() {
  getPassword "$USER" "$USER_ADMIN_KEYCHAIN"
}

getPassword() {
  security find-generic-password -a "$1" -s "$2" -w
}

userHasProvidedArguments () {
  # 0 True and 1 False
  [ $# -ge 1 ] && return 0 || return 1
}

passwordLengthGreaterThanZero () {
  # 0 True and 1 False
  [ $1 -gt 0 ] && return 0 || return 1
}

getRandomPassword() {
  length=$PASSWORD_LENGTH

  if (userHasProvidedArguments $*) && (passwordLengthGreaterThanZero $1) ; then
    length=$1
  fi

  openssl rand -base64 $length | colrm $(expr $length + 1)
}

savePassword() {
  security add-generic-password -U -a "$1" -s "$2" -w "$3"
}

saveBotPasswordInKeyChain() {
  savePassword "$USER" "$USER_BOT" "$1"
}
