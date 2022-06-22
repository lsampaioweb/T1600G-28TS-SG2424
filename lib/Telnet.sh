#!/bin/bash

# Description:  It contains scripts related telnet commands.
# Author:       Luciano Sampaio 
# Date:         20-Dec-2020

runTelnet () {
  # d "\n" -> Delimiter is a newline.
  # -n 1   -> One element per line.
  xargs -d "\n" -n 1 | telnet "$1" #>> out.txt
}
