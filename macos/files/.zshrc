# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Path to your oh-my-zsh installation.
export ZSH="/Users/cristobalgvera/.oh-my-zsh"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    zsh-z
)

# Custom stuff when Warp Terminal is used
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  ##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW
  ##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi

source $ZSH/oh-my-zsh.sh

source $(dirname $(gem which colorls))/tab_complete.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LOCALPATH=$HOME/.local
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PYENVPATH=$HOME/.pyenv
export PATH="${PYENVPATH}/shims:${GOPATH}/bin:${GOROOT}/bin:${LOCALPATH}/bin:$PATH"

# if aws_loc="$(type -p "aws")" || [[ -z $aws_loc ]]; then
#   export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
#   export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
#   export AWS_DEFAULT_REGION=$(aws configure get region)
# fi

# Custom configurations
ZSHZ_CASE=smart

# Aliases
alias repos='cd ~/Documents/Repositories'
alias ls='colorls -A --sd'
alias bup='brew cu -a --cleanup'
alias py='python'
alias lg='lazygit'
alias v='nvim'

export EDITOR='nvim'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Load Angular CLI autocompletion.
source <(ng completion script)

# Starship theme
eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
