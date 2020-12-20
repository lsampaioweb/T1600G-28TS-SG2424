#!/bin/bash

# Description:  It contains all common values that are used by several scripts.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

DEBUG=true
DEVICE_IP="192.168.0.2"
USER_ADMIN=admin
USER_ADMIN_KEYCHAIN=tplink_user_admin
TFTP_DIRECTORY="/private/tftpboot/"

SSH_VERSION="v2"
SSH_PUBLIC_KEY_PATH="$HOME/.ssh/"
SSH_PUBLIC_KEY_NAME="id_rsa_tplink"
SSH_PUBLIC_KEY_FULLNAME=$SSH_PUBLIC_KEY_NAME".pub"
SSH_PUBLIC_KEY_PATH_AND_NAME=${SSH_PUBLIC_KEY_PATH}${SSH_PUBLIC_KEY_NAME}
SSH_PUBLIC_KEY_PATH_AND_FULLNAME=${SSH_PUBLIC_KEY_PATH}${SSH_PUBLIC_KEY_FULLNAME}

SSH_CONFIG_FILE="config"
SSH_CONFIG_FILE_PATH_AND_FULLNAME=${SSH_PUBLIC_KEY_PATH}${SSH_CONFIG_FILE}
