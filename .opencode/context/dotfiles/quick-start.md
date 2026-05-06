<!-- Context: dotfiles/quick-start | Priority: high | Version: 1.0 | Updated: 2026-05-05 -->

# Dotfiles Quick Start

## Purpose

Personal macOS dotfiles repo to bootstrap tools and configuration via symlinks and install scripts.

## Setup

```bash
sh install.sh -af
```

## Key Rules

- macOS only
- zsh only
- secrets live in `~/.zshrc.local`
- tooling priority: Homebrew → mise → official method
