# Delta for symlink-layout

Structural refactor with safety improvements. No existing specifications are modified — all requirements below document behavioral invariants that MUST be preserved.

## Behavioral Invariants

### Requirement: Symlink Targets MUST Remain Identical

All symlink targets produced by `scripts/add-symlinks.sh` MUST remain identical after the improvements. The target path for every managed configuration file SHALL NOT change.

| Scenario | GIVEN | WHEN | THEN |
|----------|-------|------|------|
| Targets preserved after improvements | Current symlinks are in place | `install.sh -f` executes | Every symlink target is identical to its pre-improvement path |
| Fresh install matches old behavior | Clean machine with no existing dotfile symlinks | `install.sh -f` executes | All config directories create correct symlinks matching original `ln -sf` targets |
| Dry-run produces no side effects | Existing dotfiles in `~` | `install.sh -d` executes | No filesystem changes made; intended operations reported to stdout |

### Requirement: Safe State Transitions (SHOULD)

The system SHOULD back up existing files before creating symlinks and SHOULD prevent unlimited backup accumulation.

| Scenario | GIVEN | WHEN | THEN |
|----------|-------|------|------|
| Backup created before symlink | Existing dotfiles at target paths | `install.sh -f` executes | Timestamped backup created under `~/.dotfiles-backups/<ts>/` via `rsync`, preserving relative path from `$HOME` |
| Full restore from backup | Backup exists from prior run | Restore from backup directory | Original files restored to their target locations |
| Old backups pruned | More than 3 backups exist | `install.sh -f` finishes | Only the 3 most recent backups remain; older ones removed automatically |

### Requirement: Backup Excludes Unnecessary Artifacts (SHOULD)

The backup SHOULD exclude build artifacts and dependency directories to avoid bloating backup size.

| Scenario | GIVEN | WHEN | THEN |
|----------|-------|------|------|
| `node_modules` excluded | Config directory contains `node_modules/` | `install.sh -f` executes | `node_modules/` is not present in backup |
| `.git` excluded | Config directory contains `.git/` | `install.sh -f` executes | `.git/` is not present in backup |
| `target` excluded | Config directory contains `target/` | `install.sh -f` executes | `target/` is not present in backup |

### Requirement: Symlink Verification (SHOULD)

The system SHOULD verify each symlink after creation.

| Scenario | GIVEN | WHEN | THEN |
|----------|-------|------|------|
| Verification reports mismatch | `ln -sf` creates incorrect target | `install.sh -f` executes | Warning printed to stderr with expected and actual target |
