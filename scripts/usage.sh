#!/bin/bash

function usage {
  echo "Usage: install.sh -(a|d|f)[h]" 2>&1
  echo '   -a   install applications'
  echo '   -d   dry-run (symlinks only; no effect on -a)'
  echo '   -f   add configuration files'
  echo '   -h   show this help message'
  exit 0
}

usage
