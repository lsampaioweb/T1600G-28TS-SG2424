#!/bin/bash

# Description:  It encodes and decodes Base64 data.
# Author:       Luciano Sampaio Martins de Souza
# Date:         29-Dec-2020

encodeTextInBase64() {
  echo "$1" | base64
}

decodeTextFromBase64() {
  echo "$1" | base64 --decode
}
