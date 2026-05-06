<!-- Context: dotfiles/standards/tooling-policy | Priority: critical | Version: 1.0 | Updated: 2026-05-05 -->

# Tooling Policy

## Quick Reference

- **Target OS**: macOS only
- **Shell**: zsh
- **Install priority**: Homebrew → mise → official upstream method
- **Personal repo**: optimize for personal workflows, not team portability

---

## Install Priority Rules

1. **Prefer Homebrew** when a formula/cask exists.
2. **Use mise** for language runtimes or when pinned versions are required.
3. **Use official upstream install method** when Homebrew or mise is not available (e.g., Rust via curl).

---

## Add a New Tool Checklist

- [ ] Confirm macOS support
- [ ] Check Homebrew formula/cask
- [ ] If not available, check mise plugin
- [ ] If neither, use official method and document it
- [ ] Update `scripts/install-apps.sh`
- [ ] Update `dotfiles/lookup/config-map.md` if config files are added
- [ ] Add decision rationale to `project-intelligence/decisions-log.md`
