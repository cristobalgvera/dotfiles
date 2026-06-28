# Proposal: Stow Migration for Config Management

## Intent

Replace the fragile manual `ln -sf` approach in `scripts/add-symlinks.sh` with GNU Stow. The 12 `configs/` subdirectories are already valid Stow packages — this refactor removes the brittle 75-line script and replaces it with declarative stow commands, adding backup, dry-run, and safe-to-revert symlink management.

## Scope

### In Scope
- Replace `scripts/add-symlinks.sh` with stow semantics in `install.sh`
- Pre-flight stow installation (brew) before `-f` runs
- Backup existing target configs to `~/.dotfiles-backup-<ts>/` before stow
- Dry-run via `stow -n`, plumbed through `install.sh -n`
- Cleanup existing manually-created symlinks before stow adoption
- Handle rename patterns (config.lazygit.yml → config.yml) and multi-target packages (mise)

### Out of Scope
- Secrets hygiene, font management, `install-apps.sh` refactoring
- Cross-platform / Linux support
- Template systems (chezmoi, yadm, etc.)
- Identity/multi-machine gitconfig (already handled)

## Capabilities

### New Capabilities
None — pure structural refactor, no new spec-level behavior.

### Modified Capabilities
None — no existing specs in `openspec/specs/`.

## Approach

1. Pre-flight: `brew install stow` if missing
2. Backup: copy target files to `~/.dotfiles-backup-<timestamp>/`
3. Cleanup: remove symlinks created by the old script
4. Stow: run `stow -d configs -t <target> <pkg>` per package
5. Dry-run: `install.sh -n` maps to `stow -n`

Key nuances:
- **File renames**: Rename repo files to match target names (e.g., `config.lazygit.yml` → `config.yml`) so stow links without rename
- **Multi-target packages**: Mise targets both `~/.config/mise` and `~/` — handle via two stow calls or keep a manual link for the dotfiles
- **Tmux submodule**: Use `.stow-local-ignore` to exclude `.tmux/` from stow management

## Affected Areas

| Area | Impact | Description |
|------|--------|-------------|
| `scripts/add-symlinks.sh` | Removed | Replaced by stow |
| `install.sh` | Modified | Delegates to stow, adds `-n` flag |
| `configs/lazygit/` | Modified | Rename file for stow compatibility |
| `configs/lazydocker/` | Modified | Rename file for stow compatibility |
| `configs/tmux/` | Modified | Add `.stow-local-ignore` for submodule |

## Risks

| Risk | Likelihood | Mitigation |
|------|------------|------------|
| Existing symlinks conflict with stow | High | Backup + cleanup before first stow |
| Stow missing on fresh machine | Medium | Pre-flight brew install |
| Tmux submodule interference | Medium | `.stow-local-ignore` exclusion |
| Stow version differences | Low | Pin brew formula |

## Rollback Plan

`stow -D` on each package, then restore originals from `~/.dotfiles-backup-<ts>/`. Rollable as a single script call.

## Dependencies

- GNU Stow (brew install stow)

## Success Criteria

- [ ] `install.sh -f` produces identical symlink targets as current `add-symlinks.sh`
- [ ] `install.sh -n` runs dry-run without modifying the filesystem
- [ ] Backup dir created with original configs before any stow operation
- [ ] `stow -D` cleanly removes all stow-managed symlinks
- [ ] Restore from backup leaves system in original state
