#!/bin/bash

BASE_PATH=$(dirname "$0")/..

# If no flags are specified, then show usage script
if [[ ${#} -eq 0 ]]; then
  echo "No arguments specified"
  echo
  sh "$BASE_PATH"/macos/usage.sh
fi

optstring=":afh"

# Check if the user has passed any arguments
while getopts "$optstring" arg
do 
  case "$arg" in
    a) install_apps=1;;
    f) add_configuration_files=1;;
    h) sh "$BASE_PATH"/macos/usage.sh;;
    *) 
      echo "Invalid option: -${OPTARG}" >&2
      echo
      sh "$BASE_PATH"/macos/usage.sh
      ;;
  esac 
done

if [[ -n $install_apps ]]; then
  echo ">> Installing apps"
  sh "$BASE_PATH"/scripts/macos/install-apps.sh
fi

if [[ -n $add_configuration_files ]]; then
  echo ">> Adding configuration files"
  sh "$BASE_PATH"/scripts/macos/add-symlinks.sh
fi
