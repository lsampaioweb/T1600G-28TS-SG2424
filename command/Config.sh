#!/bin/bash

# Description:  It contains the commands that can be sent to the switch.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

sendEnableSSHServer() {
  sendCommand "ip ssh server"
}

sendDownloadSSHPublicKey() {
  sendCommand "ip ssh download $SSH_VERSION $SSH_PUBLIC_KEY_FULLNAME ip-address $1"
}

sendEnablePasswordEncryption() {
  sendCommand "service password-encryption"
}

sendDeleteUser() {
  sendCommand "no user name $1"
}

sendCreateUser() {
  sendDeleteUser "$1" # Delete the user if he/she already exists.
  sendCommand "user name $1 privilege $2 secret 0 $3"
}

sendEnableRemoteLogging() {
  sendCommand "logging host index $1 $2 $3"
}

sendEnableHTTPS() {
  sendCommand "ip http secure-server"
}

sendDownloadHTTPSCertificate() {
  sendCommand "ip http secure-server download certificate $HTTPS_CERTIFICATE_SHORT_NAME ip-address $1"
}

sendDownloadHTTPSKey() {
  sendCommand "ip http secure-server download key $HTTPS_CERTIFICATE_KEY_SHORT_NAME ip-address $1"
}

sendDisableHTTP() {
  sendCommand "no ip http server"
}

sendSetJumboSize() {
  sendCommand "jumbo-size $SIZE_OF_JUMBO_FRAME"
}

sendEnableDoSDefend() {
  sendCommand "ip dos-prevent"
}

sendSetDoSDefendTypes() {
  for i in $@ ; do
    sendCommand "ip dos-prevent type $i"
  done
}

sendSetDeviceDescription() {
  sendCommand "hostname $DEVICE_NAME"
  sendCommand "location $DEVICE_LOCATION"
  sendCommand "contact-info $(decodeTextFromBase64 $DEVICE_CONTACT_INFO)"
}

sendCreateVlan() {
  sendCommand "vlan $1"
  sendCommand "name $2"
}

sendInterfaceRangeGigabitEthernet() {
  sendCommand "interface range gigabitEthernet $1"
}

sendInterfaceRangePortChannel() {
  sendCommand "interface range port-channel $1"
}

sendAssignPortToVlan() {
  sendInterfaceRangeGigabitEthernet $2
  sendCommand "switchport general allowed vlan $1 $3"
}

sendAssignPortToVlanUntagged() {
  sendAssignPortToVlan "$1" "$2" "untagged"
}

sendAssignPortToVlanTagged() {
  sendAssignPortToVlan "$1" "$2" "tagged"
}

sendAssignLAGToVlan() {
  sendInterfaceRangePortChannel $2
  sendCommand "switchport general allowed vlan $1 $3"
}

sendAssignLAGToVlanUntagged() {
  sendAssignLAGToVlan "$1" "$2" "untagged"
}

sendAssignLAGToVlanTagged() {
  sendAssignLAGToVlan "$1" "$2" "tagged"
}

sendSetPVIDofPort() {
  sendCommand "switchport pvid $1"
}

sendDisableTelnet() {
  sendCommand "telnet disable"
}

sendSetSDMPreference() {
  sendCommand "sdm prefer $SDM_PREFERENCE"
}

sendLACPLoadBalancingAlgorithm() {
  sendCommand "port-channel load-balance $1"
}

sendLACPGroupModePassive() {
  sendCommand "channel-group $1 mode passive"
}

sendLACPPortPriority() {
  sendCommand "lacp port-priority $1"
}

sendInterfaceVlan() {
  sendCommand "interface vlan $1"
}

sendIPv4Routing() {
  sendCommand "ip routing"
}

sendDescription() {
  sendCommand "description $1"
}

sendIpAddress() {
  sendCommand "ip address $1 $2"
}

sendEnableDHCP() {
  sendCommand "service dhcp server"
}

sendDHCPPoolName() {
  sendCommand "ip dhcp server pool $1"
}

sendDHCPPoolIpAndNetwork() {
  sendCommand "network $1 $2"
}

sendDHCPPoolGateway() {
  sendCommand "default-gateway $1"
}

sendDHCPPoolDNS() {
  sendCommand "dns-server $1"
}

sendDHCPExcludedAddress() {
  sendCommand "ip dhcp server excluded-address $1"
}

sendIpRoute() {
  sendCommand "ip route $1 $2 $3 $4"
}

sendEnd() {
  sendCommand "end"
}
