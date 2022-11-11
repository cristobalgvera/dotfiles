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

	# Volta
	if ! [ -x "$(command -v volta)" ]; then
		echo "Installing Volta..."
	  /bin/bash -c "$(curl -fsSL https://get.volta.sh)" </dev/null
  fi

  # LunarVim
	if ! [ -x "$(command -v lvim)" ]; then
		echo "Installing LunarVim..."
    LV_BRANCH='release-1.2/neovim-0.8' /bin/bash <(curl -fsSL https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
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
    shellcheck
    git-delta
    rbenv
    ruby-build
    exa
    zoxide
    bat
  )

  for formulae in "${formulaes[@]}"; do
    /bin/bash -c "($basePath/brew-install.sh $formulae)"
  done
  
  # Cask
  local casks=(
    fig
    font-caskaydia-cove-nerd-font
    google-chrome
    warp
    raycast
    visual-studio-code
    whatsapp
    alt-tab
    docker
  )

  for cask in "${casks[@]}"; do
    /bin/bash -c "($basePath/brew-install.sh $cask cask)"
  done
}

function install_apps {
  local basePath=$(dirname "$0")

  echo "Installing apps..."

  install_curl_apps
  install_brew_apps
}

install_apps
