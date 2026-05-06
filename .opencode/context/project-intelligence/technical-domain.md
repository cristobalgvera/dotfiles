<!-- Context: dotfiles/project-intelligence/technical-domain | Priority: high | Version: 1.0 | Updated: 2026-05-05 -->

# Technical Domain

## Stack Summary

- **OS**: macOS
- **Shell**: zsh
- **Installers**: Homebrew, mise, official upstream scripts
- **Configs**: Managed in `configs/` and symlinked
- **Entry points**: `install.sh`, `scripts/install-apps.sh`, `scripts/add-symlinks.sh`

## Architecture Notes

- Symlink-based config management
- Scripted install flow
- Git submodule for tmux
