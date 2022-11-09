# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Zsh configs
ZSHZ_CASE=smart

# Zsh plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
)

# Custom stuff when Warp Terminal is used
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # What you want to disable for Warp
fi

# Aliases
alias repos='cd ~/Documents/Repositories'
alias ls='exa --icons --all --group-directories-first --long --header --git --no-user --octal-permissions'
alias lt='exa --icons --all --group-directories-first --long --header --git --no-user --octal-permissions --tree --level 2'
alias bup='brew cu -a --cleanup'
alias py='python'
alias lg='lazygit'
alias nvim='lvim'
alias v='nvim'

# Sourcing
if ng_loc="$(type -p "ng")" || [[ -z $ng_loc ]]; then
  source <(ng completion script)
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Init RbEnv
eval "$(rbenv init - zsh)"

# Init Starship theme
eval "$(starship init zsh)"

# Init Zoxide
eval "$(zoxide init zsh)"

# Exports
export EDITOR='lvim'

export LOCALPATH=$HOME/.local
export PYENVPATH=$HOME/.pyenv
export VOLTA_HOME="$HOME/.volta"
export PATH="${PYENVPATH}/shims:${VOLTA_HOME}/bin:${LOCALPATH}/bin:$PATH"

# if aws_loc="$(type -p "aws")" || [[ -z $aws_loc ]]; then
#   export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
#   export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
#   export AWS_DEFAULT_REGION=$(aws configure get region)
# fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
