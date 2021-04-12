#!/bin/bash

# Description:  It contains scripts related with strings.
# Author:       Luciano Sampaio 
# Date:         03-Mar-2021

stringIsEmpty () {
  # 0 True and 1 False
  [ -z "$1" ] && return 0 || return 1
}

stringIsNotEmpty () {
  # 0 True and 1 False
  (! stringIsEmpty "$1") && return 0 || return 1
}
