#!/bin/bash

# Description:  It contains methods related IP commands.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

getIpAddress() {
  ipconfig getifaddr en0
}
