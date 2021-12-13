#!/bin/bash
basePath=$HOME/Documents/Repositories/dotfiles/$(dirname $0)/../..
sharedPath=$basePath/shared
macosFilesPath=$basePath/macos/files

function link_file {
    local sourceFile=$1
    local targetFile=$2

    if [ -e $targetFile ]; then
        mv $targetFile $targetFile.backup
    fi

    ln -sf $sourceFile $targetFile
}

# Git config
link_file $sharedPath/.gitconfig ~/.gitconfig
link_file $macosFilesPath/.gitconfig-macos ~/.gitconfig-macos

# Ideavim config
link_file $sharedPath/.ideavimrc ~/.ideavimrc

# Zsh config
link_file $macosFilesPath/.zshrc ~/.zshrc

# LunarVim config
link_file $macosFilesPath/lvim-init.lua ~/.config/lvim/config.lua
