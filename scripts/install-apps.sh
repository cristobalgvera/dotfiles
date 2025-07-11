#!/bin/bash
function install_curl_apps {
  # Homebrew
  if ! [ -x "$(command -v brew)" ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Rust
  if ! [ -x "$(command -v rustc)" ]; then
    echo "Installing Rust..."
    /bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" </dev/null
  fi

  # Oh my Zsh
  if ! [ -e "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh my Zsh!..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
}

function install_git_apps {
  # Load git submodules
  git submodule update --init --recursive

  install_asdf_plugins
  install_oh_my_zsh_plugins
}

function install_oh_my_zsh_plugins {
  local ZSH_PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"

  local FZF_TAB_DIR="$ZSH_PLUGIN_DIR/fzf-tab"
  if ! [ -e "$FZF_TAB_DIR" ]; then
    echo "Installing fzf-tab..."
    git clone https://github.com/Aloxaf/fzf-tab "${FZF_TAB_DIR}"
  fi

  local ZSH_AUTOSUGGESTIONS_DIR="$ZSH_PLUGIN_DIR/zsh-autosuggestions"
  if ! [ -e "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_AUTOSUGGESTIONS_DIR}"
  fi

  local FAST_SYNTAX_HIGHLIGHTING_DIR="$ZSH_PLUGIN_DIR/fast-syntax-highlighting"
  if ! [ -e "$FAST_SYNTAX_HIGHLIGHTING_DIR" ]; then
    echo "Installing fast-syntax-highlighting..."
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "${FAST_SYNTAX_HIGHLIGHTING_DIR}"
  fi

  local ZSH_COMPLETIONS_DIR="$ZSH_PLUGIN_DIR/zsh-completions"
  if ! [ -e "$ZSH_COMPLETIONS_DIR" ]; then
    echo "Installing zsh-completions..."
    git clone https://github.com/zsh-users/zsh-completions "${ZSH_COMPLETIONS_DIR}"
  fi
}

function install_asdf_plugins {
  function is_installed {
    local plugin="$1"
    asdf list | grep -q "$plugin"
  }

  if ! is_installed "nodejs"; then
    echo "Installing Asdf NodeJS plugin..."
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf install nodejs

    echo "Enabling Corepack..."
    corepack enable
    corepack prepare npm@latest --activate
    corepack prepare pnpm@latest --activate
    asdf reshim nodejs
  fi

  if ! is_installed "python"; then
    echo "Installing Asdf Python plugin..."
    asdf plugin add python https://github.com/asdf-community/asdf-python.git

    echo "Installing Asdf UV plugin..."
    asdf plugin add uv https://github.com/asdf-community/asdf-uv.git
  fi

  if ! is_installed "golang"; then
    echo "Installing Asdf Go plugin..."
    asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
  fi

  if ! is_installed "java"; then
    echo "Installing Asdf Java plugin..."
    asdf plugin add java https://github.com/halcyon/asdf-java.git
  fi

  if ! is_installed "neovim"; then
    echo "Installing Asdf Neovim plugin..."
    asdf plugin add neovim https://github.com/richin13/asdf-neovim.git

    echo "Installing Neovim..."
    asdf install neovim
  fi
}

function install_brew_apps {
  local base_path="$1"
  local install_cmd="$base_path/brew-install.sh"

  # Tap
  local taps=(
    buo/cask-upgrade
    hashicorp/tap
  )

  for tap in "${taps[@]}"; do
    /bin/bash -c "($install_cmd $tap tap)"
  done

  brew update

  # Formulae
  local formulaes=(
    fzf
    git
    starship
    jesseduffield/lazygit/lazygit
    jesseduffield/lazydocker/lazydocker
    git-delta
    rbenv
    ruby-build
    eza
    zoxide
    bat
    commitizen
    coreutils
    curl
    ripgrep
    pngpaste
    tmux
    hashicorp/tap/terraform
    asdf
    fd
  )

  for formulae in "${formulaes[@]}"; do
    /bin/bash -c "($install_cmd $formulae)"
  done

  # Cask
  local casks=(
    font-iosevka-term-nerd-font
    raycast
    visual-studio-code
    docker
    the-unarchiver
    meetingbar
    monitorcontrol
    beekeeper-studio
    wezterm
  )

  for cask in "${casks[@]}"; do
    /bin/bash -c "($install_cmd $cask cask)"
  done
}

function install_apps {
  echo "Installing apps..."

  install_curl_apps
  install_brew_apps "$(dirname "$0")"
  install_git_apps
}

install_apps
