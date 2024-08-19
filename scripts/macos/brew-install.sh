#!/bin/bash
function install_cask {
  if brew list --cask --versions "$1" &>/dev/null; then
    echo "$1 is already installed"
  else
    brew install --cask "$1"
    echo "cask '$1' was installed"
  fi
}

function install_tap {
  brew tap "$1"
  echo "tap '$1' was installed"
}

function install_formulae {
  if brew list --versions "$1" &>/dev/null; then
    echo "$1 is already installed"
  else
    brew install "$1"
    echo "formulae '$1' was installed"
  fi
}

function brew_install {
  echo "Installing '$1'..."

  case "$2" in
  cask)
    install_cask "$1"
    ;;

  tap)
    install_tap "$1"
    ;;

  *)
    install_formulae "$1"
    ;;
  esac
}

brew_install "$1" "$2"
