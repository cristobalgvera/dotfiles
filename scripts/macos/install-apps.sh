#!/bin/bash
basePath=$HOME/Documents/Repositories/dotfiles/$(dirname $0)/..

function exists {
    local app_name = $1
    return [ -x "$(command -v $app_name)" ]
}

# Homebrew
if ! exists brew; then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
fi
