#!/bin/bash
function install {
    local basePath=$(dirname $0)/..

    # Install Homebrew and packages
    sh $basePath/scripts/macos/install-apps.sh

    # Add symbolic links to dotfiles
    sh $basePath/scripts/macos/add-symlinks.sh
}

install
