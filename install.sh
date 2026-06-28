#!/bin/bash

base_path=$(dirname "$0")

# If no flags are specified, then show usage script
if [[ ${#} -eq 0 ]]; then
  echo "No arguments specified"
  echo
  sh "$base_path"/scripts/usage.sh
fi

optstring=":afhd"

# Check if the user has passed any arguments
while getopts "$optstring" arg; do
  case "$arg" in
  a) install_apps=1 ;;
  f) add_configuration_files=1 ;;
  d) dry_run_mode=1 ;;
  h) sh "$base_path"/scripts/usage.sh ;;
  *)
    echo "Invalid option: -${OPTARG}" >&2
    echo
    sh "$base_path"/scripts/usage.sh
    ;;
  esac
done

if [[ -n $add_configuration_files ]] || [[ -n $dry_run_mode ]]; then
  echo ">> Adding configuration files"
  DRY_RUN="${dry_run_mode:-}" sh "$base_path"/scripts/add-symlinks.sh
fi

if [[ -n $install_apps ]]; then
  echo ">> Installing apps"
  sh "$base_path"/scripts/install-apps.sh
fi
