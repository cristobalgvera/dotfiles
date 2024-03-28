#!/bin/bash
function link_file {
  local sourceFile=$1
  local targetFile=$2

  if [ -e "$targetFile" ]; then
    echo "Creating backup of $targetFile"
    mv "$targetFile" "$targetFile".backup
  fi

  echo "Linking: ${sourceFile} to ${targetFile}"
  ln -sf "$sourceFile" "$targetFile"
}

function add_symlinks {
  local basePath=$HOME/Documents/Repositories/dotfiles/$(dirname "$0")/../..
  local sharedPath=$basePath/shared
  local macosFilesPath=$basePath/macos/files
  local macosFoldersPath=$basePath/macos/folders

  # Git config
  echo "Linking Git config"
  link_file "$sharedPath"/.gitconfig ~/.gitconfig
  link_file "$macosFilesPath"/.gitconfig-macos ~/.gitconfig-macos

  # Ideavim config
  echo "Linking Ideavim config"
  link_file "$sharedPath"/.ideavimrc ~/.ideavimrc

  # LunarVim config
  echo "Linking LunarVim config"
  link_file "$sharedPath"/folders/lvim ~/.config/lvim

  # Warp config
  echo "Linking Warp config"
  link_file "$macosFoldersPath"/.warp ~/.warp

  # Lazygit config
  echo "Linking Lazygit config"
  link_file "$sharedPath"/config.lazygit.yml ~/Library/Application\ Support/lazygit/config.yml

  # LazyDocker config
  echo "Linking LazyDocker config"
  link_file "$sharedPath"/config.lazydocker.yml ~/Library/Application\ Support/lazydocker/config.yml

  # Zsh config
  echo "Linking Zsh config"
  link_file "$macosFilesPath"/.zshrc ~/.zshrc
  link_file "$macosFilesPath"/.zshrc.alias ~/.zshrc.alias
  link_file "$macosFilesPath"/.zshrc.source ~/.zshrc.source
  link_file "$macosFilesPath"/.zshenv ~/.zshenv
  link_file "$macosFilesPath"/.zshenv.secret ~/.zshenv.secret

  # Starship config
  echo "Linking Starship config"
  link_file "$sharedPath"/starship.toml ~/.config/starship.toml

  # Asdf config
  echo "Linking Asdf config"
  link_file "$sharedPath"/asdf/.tool-versions ~/.tool-versions
  link_file "$sharedPath"/asdf/.asdfrc ~/.asdfrc
}

add_symlinks
