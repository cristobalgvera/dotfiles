#!/bin/bash
basePath=$HOME/Documents/Repositories/dotfiles/$(dirname $0)/..

# Install Homebrew and packages
sh $basePath/scripts/macos/install-apps.sh

# Add symbolic links to dotfiles
sh $basePath/scripts/macos/add-symlinks.sh
