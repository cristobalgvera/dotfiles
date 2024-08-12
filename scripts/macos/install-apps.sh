#!/bin/bash
function install_curl_apps {
	# Homebrew
	if ! [ -x "$(command -v brew)" ]; then
		echo "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
	fi

	# Rust
	if ! [ -x "$(command -v rustc)" ]; then
		echo "Installing Rust..."
	  /bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" </dev/null
  fi

  # LunarVim
	if ! [ -x "$(command -v lvim)" ]; then
		echo "Installing LunarVim..."
    export LV_BRANCH='release-1.4/neovim-0.9'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)" </dev/null
  fi
}

function install_git_apps {
	# Asdf
	if ! [ -x "$(command -v asdf)" ]; then
		echo "Installing Asdf..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

    # shellcheck disable=1091
    source "$HOME/.asdf/asdf.sh"
  fi

  install_asdf_plugins
}

function install_asdf_plugins {
	  if ! [ -x "$(command -v node)" ]; then
      echo "Installing Asdf NodeJS plugin..."
      asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

      echo "Enabling pnpm..."
      corepack enable
      corepack prepare pnpm@latest --activate
      asdf reshim nodejs
    fi

	  if ! [ -x "$(command -v gleam)" ]; then
      echo "Installing Asdf Erlang plugin..."
      asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

      echo "Installing Asdf Rebar plugin"
      asdf plugin add rebar https://github.com/Stratus3D/asdf-rebar.git

      echo "Installing Asdf Gleam plugin..."
      asdf plugin add gleam https://github.com/asdf-community/asdf-gleam.git
    fi

	  if ! [ -x "$(command -v python)" ]; then
      echo "Installing Asdf Python plugin..."
      asdf plugin add python https://github.com/asdf-community/asdf-python.git
    fi

	  if ! [ -x "$(command -v nvim)" ]; then
      echo "Installing Asdf Neovim plugin..."
      asdf plugin add neovim https://github.com/richin13/asdf-neovim.git

      echo "Installing Neovim..."
      asdf install neovim stable
    fi
}

function install_brew_apps {
  # Tap
  local taps=(
    homebrew/cask-fonts
    buo/cask-upgrade
  )

  for tap in "${taps[@]}"; do
    /bin/bash -c "($basePath/brew-install.sh $tap tap)"
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
  )

  for formulae in "${formulaes[@]}"; do
    /bin/bash -c "($basePath/brew-install.sh $formulae)"
  done
  
  # Cask
  local casks=(
    font-victor-mono-nerd-font
    google-chrome
    warp
    raycast
    visual-studio-code
    whatsapp
    alt-tab
    docker
    the-unarchiver
    meetingbar
    monitorcontrol
  )

  for cask in "${casks[@]}"; do
    /bin/bash -c "($basePath/brew-install.sh $cask cask)"
  done
}

function install_apps {
  local basePath
  basePath=$(dirname "$0")

  echo "Installing apps..."

  install_curl_apps
  install_brew_apps
  install_git_apps
}

install_apps
