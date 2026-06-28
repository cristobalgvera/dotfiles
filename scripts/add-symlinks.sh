#!/bin/bash
# scripts/add-symlinks.sh - Symlink dotfiles configs to their target locations
#
# Called by install.sh -f. Dry-run: set DRY_RUN=1 to preview without changes.
set -euo pipefail

CONFIGS_PATH="$(dirname "$(realpath "$0")")/../configs"
DRY_RUN="${DRY_RUN:-}"

# --- Helpers ---

backup_file() {
  local src="$1"
  if [ -n "$DRY_RUN" ]; then
    echo "[DRY-RUN] Would backup: $src"
    return
  fi
  if [ -e "$src" ] || [ -L "$src" ]; then
    # Compute relative path from $HOME to preserve directory structure in backup
    local rel="${src/#$HOME\//}"
    local dest="$BACKUP_DIR/$rel"
    mkdir -p "$(dirname "$dest")"
    rsync -aL \
      --exclude='node_modules' \
      --exclude='.git' \
      --exclude='target' \
      --exclude='__pycache__' \
      "$src" "$dest" 2>/dev/null || true
  fi
}

link_file() {
  local source_file="$1"
  local target_file="$2"

  # When target is a real directory, ln -sf creates <target>/<basename> → source
  # inside it rather than replacing the directory. That entry is the real victim.
  local victim
  if [ -d "$target_file" ] && [ ! -L "$target_file" ]; then
    victim="$target_file/$(basename "$source_file")"
  else
    victim="$target_file"
  fi

  if [ -n "$DRY_RUN" ]; then
    echo "[DRY-RUN] Would link: $source_file → $victim"
    return
  fi

  # Backup only what will be overwritten
  if [ -e "$victim" ] || [ -L "$victim" ]; then
    backup_file "$victim"
  fi

  mkdir -p "$(dirname "$target_file")"
  ln -sf "$source_file" "$target_file"

  # Verify symlink
  local check_target
  if [ -d "$target_file" ] && [ ! -L "$target_file" ]; then
    check_target="$target_file/$(basename "$source_file")"
  else
    check_target="$target_file"
  fi
  if [ "$(readlink "$check_target" 2>/dev/null || true)" != "$source_file" ]; then
    echo "WARNING: Symlink verification failed for $check_target" >&2
    echo "  Expected: $source_file" >&2
    echo "  Got: $(readlink "$check_target" 2>/dev/null || true)" >&2
  fi
}

add_symlinks() {
  if [ -z "$DRY_RUN" ]; then
    local backup_root="$HOME/.dotfiles-backups"
    local ts
    ts="$(date +%Y%m%d-%H%M%S)"
    BACKUP_DIR="$backup_root/$ts"
    mkdir -p "$BACKUP_DIR"
    echo ">> Backup created at $BACKUP_DIR"

    # Prune: keep only the 3 most recent backups
    local backups
    backups="$(ls -1d "$backup_root/"* 2>/dev/null | sort -r || true)"
    local keep=0
    while IFS= read -r dir; do
      keep=$((keep + 1))
      if [ "$keep" -gt 3 ]; then
        rm -rf "$dir"
        echo ">> Removed old backup: $(basename "$dir")"
      fi
    done <<< "$backups"
  fi

  echo "Linking Git config"
  link_file "$CONFIGS_PATH"/git/.gitconfig ~/.gitconfig
  link_file "$CONFIGS_PATH"/git/.gitconfig-macos ~/.gitconfig-macos

  # Create local gitconfig for org-specific configs if missing
  if [ ! -e ~/.gitconfig-local ]; then
    echo "Creating example ~/.gitconfig-local file"
    {
      printf '[includeIf "gitdir/i:projects/org-name/"]\n  path = ~/.gitconfig-org-name'
    } >> ~/.gitconfig-local
  fi

  # Ensure ~/.config exists
  if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
  fi

  echo "Linking Neovim config"
  link_file "$CONFIGS_PATH"/nvim ~/.config

  echo "Linking OpenCode config"
  link_file "$CONFIGS_PATH"/opencode ~/.config

  echo "Linking WezTerm config"
  link_file "$CONFIGS_PATH"/wezterm ~/.config

  echo "Linking Tmux config"
  mkdir -p "$HOME/.config/tmux"
  link_file "$CONFIGS_PATH"/tmux/.tmux/.tmux.conf "$HOME/.config/tmux/tmux.conf"
  link_file "$CONFIGS_PATH"/tmux/tmux.conf.local "$HOME/.config/tmux/tmux.conf.local"

  echo "Linking Lazygit config"
  link_file "$CONFIGS_PATH"/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

  echo "Linking LazyDocker config"
  link_file "$CONFIGS_PATH"/lazydocker/config.yml ~/Library/Application\ Support/lazydocker/config.yml

  echo "Linking Zsh config"
  link_file "$CONFIGS_PATH"/zsh/.zshrc ~/.zshrc
  link_file "$CONFIGS_PATH"/zsh/.zshrc.oh-my-zsh ~/.zshrc.oh-my-zsh
  link_file "$CONFIGS_PATH"/zsh/.zshrc.alias ~/.zshrc.alias
  link_file "$CONFIGS_PATH"/zsh/.zshrc.source ~/.zshrc.source
  link_file "$CONFIGS_PATH"/zsh/.zshenv ~/.zshenv
  link_file "$CONFIGS_PATH"/zsh/.zshenv.secret ~/.zshenv.secret

  # Create local zshrc for per-machine config if missing
  if [ ! -e ~/.zshrc.local ]; then
    echo "Creating empty ~/.zshrc.local file"
    touch ~/.zshrc.local
  fi

  echo "Linking Starship config"
  link_file "$CONFIGS_PATH"/starship/starship.toml ~/.config/starship.toml

  echo "Linking mise config"
  link_file "$CONFIGS_PATH"/mise ~/.config
  link_file "$CONFIGS_PATH"/mise/.default-npm-packages ~/.default-npm-packages
  link_file "$CONFIGS_PATH"/mise/.default-python-packages ~/.default-python-packages

  echo "Linking Tuxedo config"
  link_file "$CONFIGS_PATH"/tuxedo ~/.config
}

add_symlinks

echo ">> Configuration files linked successfully"
