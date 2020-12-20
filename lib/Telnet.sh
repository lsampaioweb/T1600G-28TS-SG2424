#!/bin/bash

# Description:  It contains scripts related telnet commands.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

runTelnet () {
  ( xargs -I {} ) | telnet "$1" #>> out.txt
}
