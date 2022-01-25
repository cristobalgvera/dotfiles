#!/bin/bash
function install_cask {
	if brew list --cask --versions "$1" &>/dev/null; then
		echo "$1 is already installed"
	else
		brew install --cask "$1"
		echo "$1 was installed"
	fi
}

function install_formulae {
	if brew list --versions "$1" &>/dev/null; then
		echo "$1 is already installed"
	else
		brew install "$1"
		echo "$1 was installed"
	fi
}

function brew_install {
	echo "Installing $1..."

	if [ "$2" == "cask" ]; then
		install_cask "$1"
	else
		install_formulae "$1"
	fi
}

brew_install "$1" "$2"
