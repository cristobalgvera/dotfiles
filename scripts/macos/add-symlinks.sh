#!/bin/bash
function link_file {
  local sourceFile=$1
  local targetFile=$2

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
  echo "Linking Neovim config"
  link_file "$sharedPath"/nvim ~/.config/nvim

  # WezTerm config
  echo "Linking WezTerm config"
  link_file "$sharedPath"/wezterm ~/.config/wezterm

  # Tmux config
  echo "Linking Tmux config"
  ! [ -e "$HOME/.config/tmux" ] && mkdir -p "$HOME/.config/tmux"
  link_file "$sharedPath"/.tmux/.tmux.conf ~/.config/tmux/tmux.conf
  link_file "$sharedPath"/tmux.conf.local ~/.config/tmux/tmux.conf.local

  # Lazygit config
  echo "Linking Lazygit config"
  link_file "$sharedPath"/config.lazygit.yml ~/Library/Application\ Support/lazygit/config.yml

  # LazyDocker config
  echo "Linking LazyDocker config"
  link_file "$sharedPath"/config.lazydocker.yml ~/Library/Application\ Support/lazydocker/config.yml

  # Zsh config
  echo "Linking Zsh config"
  link_file "$macosFilesPath"/.zshrc ~/.zshrc
  link_file "$macosFilesPath"/.zshrc.oh-my-zsh ~/.zshrc.oh-my-zsh
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
  link_file "$sharedPath"/asdf/.default-npm-packages ~/.default-npm-packages
  link_file "$sharedPath"/asdf/.default-python-packages ~/.default-python-packages
}

add_symlinks
