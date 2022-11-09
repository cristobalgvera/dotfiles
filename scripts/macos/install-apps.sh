#!/bin/bash
function install_apps {
	local basePath=$(dirname $0)

	echo "Installing apps..."

	# Homebrew
	if ! [ -x "$(command -v brew)" ]; then
		echo "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
	fi

	# Tap
	local taps=(
    		homebrew/cask-fonts
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
	)

	for cask in "${casks[@]}"; do
		/bin/bash -c "($basePath/brew-install.sh $cask cask)"
	done
}

install_apps
