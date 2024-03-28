#!/bin/bash
function install_curl_apps {
	# Homebrew
	if ! [ -x "$(command -v brew)" ]; then
		echo "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
	fi

	# Sdkman
	if ! [ -x "$(command -v sdk)" ]; then
		echo "Installing Sdkman..."
	  /bin/bash -c "$(curl -fsSL https://get.sdkman.io?rcupdate=false)" </dev/null
  fi

	# Rust
	if ! [ -x "$(command -v rustc)" ]; then
		echo "Installing Rust..."
	  /bin/bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" </dev/null
  fi

  # LunarVim
	if ! [ -x "$(command -v lvim)" ]; then
		echo "Installing LunarVim..."
    # FIX: Install command is not working
    # LV_BRANCH='release-1.3/neovim-0.9' /bin/bash <(curl -fsSL https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
  fi
}

function install_git_apps {
	# Asdf
	if ! [ -x "$(command -v asdf)" ]; then
		echo "Installing Asdf..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

    . "$HOME"/.asdf/asdf.sh

    echo "Installing Asdf NodeJS plugin..."
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

    echo "Installing Asdf Erlang plugin..."
    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

    echo "Installing Asdf Gleam plugin..."
    asdf plugin add gleam https://github.com/asdf-community/asdf-gleam.git
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
    neovim
    starship
    jesseduffield/lazygit/lazygit
    jesseduffield/lazydocker/lazydocker
    shellcheck
    git-delta
    rbenv
    ruby-build
    exa
    zoxide
    bat
    commitizen
    coreutils
    curl
    autoconf
    openssl
    wxwidgets
    libxslt
    fop
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
