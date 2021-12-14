#!/bin/bash
function install_apps {
    local basePath=$(dirname $0)

    echo "Installing apps..."

    # Homebrew
    if ! [ -x "$(command -v brew)" ]; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
    fi

    brew update

    # Formulae
    local formulaes=(
        go
        fzf
        git
        neovim
    )

    for formulae in "${formulaes[@]}"; do
        /bin/bash -c "($basePath/brew-install.sh $formulae)"
    done

    # Create a Go workspace if it doesn't exist
    if [ ! -d $HOME/go ]; then
        mkdir -p $HOME/go/{src,pkg,bin}
    fi

    # Cask
    local casks=(
        fig
        font-caskaydia-cove-nerd-font
        font-source-code-pro
        google-chrome
        google-drive
        iterm2
        rar
        raycast
        visual-studio-code
        whatsapp
    )

    for cask in "${casks[@]}"; do
        /bin/bash -c "($basePath/brew-install.sh $cask cask)"
    done
}

install_apps
