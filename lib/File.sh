#!/bin/bash

# Description:  It contains scripts related with files.
# Author:       Luciano Sampaio Martins de Souza
# Date:         20-Dec-2020

fileExists () {
  # 0 True and 1 False
  [ -f "$1" ] && return 0 || return 1
}

textExistsInFile () {
  # The -r option passed to read command prevents backslash escapes from being interpreted.
  # Add IFS= option before read command to prevent leading/trailing whitespace from being trimmed -
  file=$1
  textToSearch=$2

  while IFS= read -r line
  do
    if [ "$line" == "$textToSearch" ]; then
      return 0 # True
    fi
  done < "$file"

  return 1 # False
}

deleteFile () {
  if ( fileExists "$1" ); then
    rm "$1"
  fi
}
