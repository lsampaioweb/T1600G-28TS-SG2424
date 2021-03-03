#!/bin/bash

# Description:  It contains all common values that are used by several scripts.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

DEBUG=true
DEVICE_IP="192.168.0.3"
DEVICE_NAME="T1600G-28TS-01"
DEVICE_LOCATION="Brazil-DataCenter-01"
DEVICE_CONTACT_INFO="bHNhbXBhaW93ZWJAZ21haWwuY29tCg=="

USER_ADMIN=admin
USER_ADMIN_KEYCHAIN=tplink_user_admin
USER_BOT=tplink_user_bot
USER_BOT_PRIVILEGE=admin
PASSWORD_LENGTH=31

IP_REMOTE_LOGGING_SERVER="192.168.0.4"
LOG_LEVEL=6 #Info

SIZE_OF_JUMBO_FRAME=9000

SDM_PREFERENCE=enterpriseV4

TFTP_DIRECTORY="/private/tftpboot/"

SSH_VERSION="v2"
SSH_PUBLIC_KEY_PATH="$HOME/.ssh/"
SSH_PUBLIC_KEY_NAME="id_rsa_tplink"
SSH_PUBLIC_KEY_FULLNAME=$SSH_PUBLIC_KEY_NAME".pub"
SSH_PUBLIC_KEY_PATH_AND_NAME=${SSH_PUBLIC_KEY_PATH}${SSH_PUBLIC_KEY_NAME}
SSH_PUBLIC_KEY_PATH_AND_FULLNAME=${SSH_PUBLIC_KEY_PATH}${SSH_PUBLIC_KEY_FULLNAME}

SSH_CONFIG_FILE="config"
SSH_CONFIG_FILE_PATH_AND_FULLNAME=${SSH_PUBLIC_KEY_PATH}${SSH_CONFIG_FILE}

FIRMWARE_FILE_NAME="T1600G-28TS-V3-20200805"
FIRMWARE_FILE_NAME_BIN="${FIRMWARE_FILE_NAME}.bin"
FIRMWARE_FILE_NAME_ZIP="${FIRMWARE_FILE_NAME}.zip"
FIRMWARE_URL="https://static.tp-link.com/2020/202009/20200922/T1600G-28TS(UN)_V3_20200805.zip"
FIRMWARE_PATH="firmware/"

TIME_ZONE="UTC-03:00"
PRIMARY_NTP_SERVER="200.160.7.186"
SECONDARY_NTP_SERVER="201.49.148.135"
NTP_UPDATE_RATE="12"

HTTPS_FILES_PATH="certificate/"
HTTPS_CERTIFICATE_CONFIG="aprendendo.conf"
HTTPS_CERTIFICATE="aprendendo.crt"
HTTPS_CERTIFICATE_KEY="aprendendo.key"
HTTPS_CERTIFICATE_PEM="aprendendo.pem"
HTTPS_CERTIFICATE_CONFIG_PATH_AND_NAME=${HTTPS_FILES_PATH}${HTTPS_CERTIFICATE_CONFIG}
HTTPS_CERTIFICATE_PATH_AND_NAME=${HTTPS_FILES_PATH}${HTTPS_CERTIFICATE}
HTTPS_CERTIFICATE_KEY_PATH_AND_NAME=${HTTPS_FILES_PATH}${HTTPS_CERTIFICATE_KEY}
HTTPS_CERTIFICATE_PEM_PATH_AND_NAME=${HTTPS_FILES_PATH}${HTTPS_CERTIFICATE_PEM}
KEYCHAIN_PATH="/Library/Keychains/System.keychain"

BACKUP_PATH="backup/"
BACKUP_NAME="backup-startup-config-"
BACKUP_EXTENSION=".cfg"

LACP_LOAD_BALANCE="src-dst-mac"
LACP_PATH_OF_GROUPS_VARIABLES="option/lacp/*.sh"
VLAN_PATH_OF_VARIABLES="option/vlan/*.sh"
