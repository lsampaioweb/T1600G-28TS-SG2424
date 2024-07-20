#!/bin/bash

# Description:  It contains all common values that are used by several scripts.
# Author:       Luciano Sampaio
# Date:         20-Dec-2020

DEBUG=false
DEVICE_IP="switch.lan.homelab"
DEVICE_NAME="T1600G-28TS"
DEVICE_LOCATION="DC-BR-SE-AJU-SWITCH-01"
DEVICE_CONTACT_INFO="bHNhbXBhaW93ZWJAZ21haWwuY29tCg=="

USER_ADMIN="admin"
USER_ADMIN_PASSWORD_KEY="switch-user-admin"
USER_BOT="switch-user-bot"
USER_BOT_PRIVILEGE="admin"
PASSWORD_LENGTH=31

TFTP_USER_GROUP="tftp:tftp"
TFTP_DIRECTORY="/srv/tftp/"
TFTP_CONFIG_DIRECTORY="/etc/default/tftpd-hpa"
TFTP_SERVICE_NAME="tftpd-hpa"

SSH_VERSION="v2"
SSH_PUBLIC_KEY_PATH="$HOME/.ssh/"
SSH_PUBLIC_KEY_NAME="id_rsa_tplink"
SSH_PUBLIC_KEY_FULLNAME=$SSH_PUBLIC_KEY_NAME".pub"
SSH_PUBLIC_KEY_PATH_AND_NAME=${SSH_PUBLIC_KEY_PATH}${SSH_PUBLIC_KEY_NAME}
SSH_PUBLIC_KEY_PATH_AND_FULLNAME=${SSH_PUBLIC_KEY_PATH}${SSH_PUBLIC_KEY_FULLNAME}

SSH_CONFIG_FILE="config"
SSH_CONFIG_FILE_PATH_AND_FULLNAME=${SSH_PUBLIC_KEY_PATH}${SSH_CONFIG_FILE}

TIME_ZONE="UTC-03:00"
# PRIMARY_NTP_SERVER="10.0.2.1"
# SECONDARY_NTP_SERVER="10.0.2.2"
PRIMARY_NTP_SERVER="200.160.7.186"
SECONDARY_NTP_SERVER="200.160.0.8"
NTP_UPDATE_RATE="12"

IP_REMOTE_LOGGING_SERVER="10.0.2.5"
LOG_LEVEL=6 #Info

HTTPS_FILES_PATH="/opt/certificates/switch.lan.homelab/"
HTTPS_CERTIFICATE="switch.lan.homelab.crt"
HTTPS_CERTIFICATE_KEY="switch.lan.homelab.key"
HTTPS_CERTIFICATE_PATH_AND_NAME=${HTTPS_FILES_PATH}${HTTPS_CERTIFICATE}
HTTPS_CERTIFICATE_KEY_PATH_AND_NAME=${HTTPS_FILES_PATH}${HTTPS_CERTIFICATE_KEY}
HTTPS_CERTIFICATE_SHORT_NAME="certificate.crt"
HTTPS_CERTIFICATE_KEY_SHORT_NAME="certificate.key"

SIZE_OF_JUMBO_FRAME=9216

SDM_PREFERENCE="enterpriseV4"

EEE_INTERFACES="1/0/1-24"
EEE_LACPS="1-6"

OPTION_FOLDER="option"

LACP_LOAD_BALANCE="src-dst-mac"
LACP_PATH_OF_GROUPS_VARIABLES="$OPTION_FOLDER/lacp/*.sh"

VLAN_PATH_OF_VARIABLES="$OPTION_FOLDER/vlan"
VLAN_PATH_OF_VARIABLES_WITH_FILTER="$VLAN_PATH_OF_VARIABLES/*.sh"

STATIC_ROUTE_DESTINATION_IP="0.0.0.0"
STATIC_ROUTE_SUBNET_MASK="0.0.0.0"
STATIC_ROUTE_DEFAULT_GATEWAY_IP="192.168.0.2"
STATIC_ROUTE_DEFAULT_GATEWAY_DISTANCE=1

FIRMWARE_FILE_NAME="T1600G-28TS-V3-20200805"
FIRMWARE_FILE_NAME_BIN="${FIRMWARE_FILE_NAME}.bin"
FIRMWARE_FILE_NAME_ZIP="${FIRMWARE_FILE_NAME}.zip"
FIRMWARE_URL="https://static.tp-link.com/2020/202009/20200922/T1600G-28TS(UN)_V3_20200805.zip"
FIRMWARE_PATH="firmware/"

BACKUP_PATH="backup/"
BACKUP_NAME="backup-startup-config-"
BACKUP_EXTENSION=".cfg"
