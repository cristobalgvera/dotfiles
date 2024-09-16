#!/bin/bash

function usage {
  echo "Usage: install.sh -(a|f)[h]" 2>&1
  echo '   -a   install applications'
  echo '   -f   add configuration files'
  echo '   -h   show this help message'
  exit 0
}

usage
