# Design: Dotfiles Config Management Improvements

## Technical Approach

Improve the existing `scripts/add-symlinks.sh` by adding safety mechanisms — backup, dry-run, and symlink verification — while keeping its simple `ln -sf` structure. Zero new dependencies, zero package restructuring.

GNU Stow was evaluated but rejected because it required nesting `configs/<pkg>/.config/<pkg>/` for 5 of 12 packages, coupling the repo structure to Stow internals.

## What Changed

| File | Action | Description |
|------|--------|-------------|
| `scripts/add-symlinks.sh` | Modified | Added backup, dry-run, verification |
| `install.sh` | Modified | Added `-d` flag, wires `DRY_RUN=1` |
| `configs/lazygit/config.lazygit.yml` | Renamed | → `config.yml` (bug fix — tool expects this name) |
| `configs/lazydocker/config.lazydocker.yml` | Renamed | → `config.yml` (same bug fix) |

## Improvements to add-symlinks.sh

- **`set -euo pipefail`** — fails fast on errors
- **Backup** — `cp -RL` resolves symlinks to standalone copies in `~/.dotfiles-backup-<ts>/` before overwriting
- **Dry-run** — `DRY_RUN=1` prints planned operations without modifying filesystem
- **Verification** — `readlink` check after each symlink warns on mismatch
- **Structure** — same 80-line `link_file` pattern, no external dependencies

## File Changes

Nvim, opencode, wezterm, tuxedo, and mise packages maintain their original flat structure. `ln -sf <dir> ~/.config` creates directory symlinks correctly without nesting.
