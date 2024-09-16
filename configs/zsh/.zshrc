# Custom stuff when Warp Terminal is used
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # What you want to disable for Warp
fi

# Load Oh my Zsh
[[ -s "$HOME/.zshrc.oh-my-zsh" ]] && source "$HOME/.zshrc.oh-my-zsh"

# Set aliases
[[ -s "$HOME/.zshrc.alias" ]] && source "$HOME/.zshrc.alias"

# Export common source files
[[ -s "$HOME/.zshrc.source" ]] && source "$HOME/.zshrc.source"

# Export secret environment variables
[[ -s "$HOME/.zshenv.secret" ]] && source "$HOME/.zshenv.secret"

# Export custom local configuration if found
[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
