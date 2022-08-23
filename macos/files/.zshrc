# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
if [[ $TERM_PROGRAM = "WarpTerminal" ]]; then
  ZSH_THEME="spaceship"
else
  ##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW
  ZSH_THEME="powerlevel10k/powerlevel10k"

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  # Disable iTerm integration
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
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

if aws_loc="$(type -p "aws")" || [[ -z $aws_loc ]]; then
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
  export AWS_DEFAULT_REGION=$(aws configure get region)
fi

# Custom configurations
ZSHZ_CASE=smart

# Aliases
alias repos='cd ~/Documents/Repositories'
alias ls='colorls -A --sd'
alias bup='brew cu -a --cleanup'
alias py='python'

export EDITOR='nvim'

if nvim_loc="$(type -p "nvim")" || [[ -z $nvim_loc ]]; then
  alias v='nvim'
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Load Angular CLI autocompletion.
source <(ng completion script)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
