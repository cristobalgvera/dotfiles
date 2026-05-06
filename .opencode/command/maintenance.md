---
description: Review dotfiles maintenance tasks (brew, mise, symlinks)
tags:
  - dotfiles
  - maintenance
  - audit
dependencies:
  - agent:dotfiles-maintainer
  - context:dotfiles/quick-start
  - context:dotfiles/guides/install-flow
  - context:dotfiles/lookup/config-map
  - context:dotfiles/standards/tooling-policy
  - context:dotfiles/standards/maintenance
  - context:dotfiles/standards/secrets-local-overrides
---

# Dotfiles Maintenance

**Purpose**: Review and report maintenance status for this repo.

## What to do

1. Summarize installed tooling policy (Homebrew → mise → official).
2. Check for drift between configs and symlink targets.
3. Review brew formulae/casks in `scripts/install-apps.sh` for relevance.
4. Note any missing documentation or decision log entries.

## Output format

- **Status**: green/yellow/red
- **Findings**: bullet list
- **Suggested Actions**: bullet list
