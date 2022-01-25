#!/bin/bash
function link_file {
	local sourceFile=$1
	local targetFile=$2

	echo "Linking: ${sourceFile} to ${targetFile}"

	if [ -e "$targetFile" ]; then
		echo "Creating backup of $targetFile"
		mv "$targetFile" "$targetFile".backup
	fi

	ln -sf "$sourceFile" "$targetFile"
}

function add_symlinks {
	local basePath=$HOME/Documents/Repositories/dotfiles/$(dirname $0)/../..
	local sharedPath=$basePath/shared
	local macosFilesPath=$basePath/macos/files

	# Git config
	echo "Linking Git config"
	link_file "$sharedPath"/.gitconfig ~/.gitconfig
	link_file "$macosFilesPath"/.gitconfig-macos ~/.gitconfig-macos

	# Ideavim config
	echo "Linking Ideavim config"
	link_file "$sharedPath"/.ideavimrc ~/.ideavimrc

	# Neovim config
	echo "Linking Neovim config"
	link_file "$sharedPath"/folders/nvim ~/.config/nvim

	# Lazygit config
	echo "Linking Lazygit config"
	link_file "$sharedPath"/config.lazygit.yml ~/Library/Application\ Support/lazygit/config.yml

	# Zsh config
	echo "Linking Zsh config"
	link_file "$macosFilesPath"/.zshrc ~/.zshrc
}

add_symlinks
