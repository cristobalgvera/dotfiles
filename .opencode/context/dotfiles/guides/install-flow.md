<!-- Context: dotfiles/guides/install-flow | Priority: high | Version: 1.0 | Updated: 2026-05-05 -->

# Install Flow

## Summary

The install entrypoint is `install.sh` and supports two flags:
- `-a` install apps
- `-f` add config symlinks

## Steps

1. **Install apps**
   - Homebrew setup
   - Rust (official installer if missing)
   - Oh My Zsh (unattended)
   - Brew formulae/casks
   - Git submodules
   - mise tools
   - zsh plugins
2. **Add configs**
   - Create `~/.config` if missing
   - Symlink configs from `configs/`
   - Create `~/.zshrc.local` if missing

## Notes

- macOS only
- zsh only
- secrets go to `~/.zshrc.local`
