<!-- Context: dotfiles/project-intelligence/decisions-log | Priority: high | Version: 1.0 | Updated: 2026-05-05 -->

# Decisions Log

## 2026-05-05

### Decision: Store repo context in root `.opencode/`

**Why**: Repo-specific knowledge should live alongside the repo and not inside symlinked configs.

**Outcome**: Added `.opencode/context/` with dotfiles-specific structure and standards.
