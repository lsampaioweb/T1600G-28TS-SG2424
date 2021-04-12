#!/bin/bash

# Description:  Create the user that will be used by the script to perform tasks in the switch. The ideia is not to use the admin user.
# Author:       Luciano Sampaio 
# Date:         21-Dec-2020

createBotUser () {
  logInfo "Creating Bot User."

  botPassword=$(getRandomPassword)

  (
    sendEnable
    sendConfig
    sendCreateUser "$USER_BOT" "$USER_BOT_PRIVILEGE" "$botPassword"
    sendEnd
    sendSaveSettings
    sendExit
    sendExit
  ) | runSSH $USER_ADMIN@$DEVICE_IP

  saveBotPasswordInKeyChain "$botPassword"

  logInfo "Finished."
}
