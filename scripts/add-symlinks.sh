#!/bin/bash
function link_file {
  local source_file=$1
  local target_file=$2

  echo "Linking: ${source_file} to ${target_file}"
  ln -sf "$source_file" "$target_file"
}

function add_symlinks {
  local configs_path
  configs_path=$(dirname "$(realpath "$0")")/../configs

  echo "Linking Git config"
  link_file "$configs_path"/git/.gitconfig ~/.gitconfig
  link_file "$configs_path"/git/.gitconfig-macos ~/.gitconfig-macos

  # Create a local gitconfig file for org specific configurations
  if [ ! -e ~/.gitconfig-local ]; then
    echo "Creating example ~/.gitconfig-local file"
    printf '[includeIf "gitdir/i:projects/org-name/"]\n  path = ~/.gitconfig-org-name' >>~/.gitconfig-local
  fi

  echo "Linking Neovim config"
  link_file "$configs_path"/nvim ~/.config/nvim

  echo "Linking MCPHub config"
  link_file "$configs_path"/mcphub ~/.config/mcphub

  echo "Linking WezTerm config"
  link_file "$configs_path"/wezterm ~/.config/wezterm

  echo "Linking Tmux config"
  ! [ -e "$HOME/.config/tmux" ] && mkdir -p "$HOME/.config/tmux"
  link_file "$configs_path"/tmux/.tmux/.tmux.conf ~/.config/tmux/tmux.conf
  link_file "$configs_path"/tmux/tmux.conf.local ~/.config/tmux/tmux.conf.local

  echo "Linking Lazygit config"
  link_file "$configs_path"/lazygit/config.lazygit.yml ~/Library/Application\ Support/lazygit/config.yml

  echo "Linking LazyDocker config"
  link_file "$configs_path"/lazydocker/config.lazydocker.yml ~/Library/Application\ Support/lazydocker/config.yml

  echo "Linking Zsh config"
  link_file "$configs_path"/zsh/.zshrc ~/.zshrc
  link_file "$configs_path"/zsh/.zshrc.oh-my-zsh ~/.zshrc.oh-my-zsh
  link_file "$configs_path"/zsh/.zshrc.alias ~/.zshrc.alias
  link_file "$configs_path"/zsh/.zshrc.source ~/.zshrc.source
  link_file "$configs_path"/zsh/.zshenv ~/.zshenv
  link_file "$configs_path"/zsh/.zshenv.secret ~/.zshenv.secret

  # Create a local zshrc file for laptop's specific configurations
  if [ ! -e ~/.zshrc.local ]; then
    echo "Creating empty ~/.zshrc.local file"
    touch ~/.zshrc.local
  fi

  echo "Linking Starship config"
  link_file "$configs_path"/starship/starship.toml ~/.config/starship.toml

  echo "Linking Asdf config"
  link_file "$configs_path"/asdf/.tool-versions ~/.tool-versions
  link_file "$configs_path"/asdf/.asdfrc ~/.asdfrc
  link_file "$configs_path"/asdf/.default-npm-packages ~/.default-npm-packages
  link_file "$configs_path"/asdf/.default-python-packages ~/.default-python-packages
}

add_symlinks
