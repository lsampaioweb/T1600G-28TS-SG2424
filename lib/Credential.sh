#!/bin/bash

# Description:  It retrieves or saves passwords from and to the vault.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

getAdminPasswordFromVault() {
  getPassword "$USER_ADMIN_PASSWORD_KEY"
}

getPassword() {
  secret-tool lookup password "$1"
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
  echo -n "$2" | secret-tool store --label="$1" password "$1"
}

saveBotPasswordInKeyChain() {
  savePassword "$USER_BOT" "$1"
}
