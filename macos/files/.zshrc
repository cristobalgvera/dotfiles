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

# Set aliases
[[ -s "$HOME/.zshrc.alias" ]] && source "$HOME/.zshrc.alias"

# Export common source files
[[ -s "$HOME/.zshrc.source" ]] && source "$HOME/.zshrc.source"

# Export secret environment variables
[[ -s "$HOME/.zshenv.secret" ]] && source "$HOME/.zshenv.secret"

# Export custom local configuration if found
[[ -s "$HOME/.zshrc.custom" ]] && source "$HOME/.zshrc.custom"
