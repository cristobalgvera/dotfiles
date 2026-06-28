# Tasks: Dotfiles Config Management Improvements

## Review Workload Forecast

| Field | Value |
|-------|-------|
| Estimated changed lines | ~150 (20 del, ~130 add) |
| 400-line budget risk | Low |
| Chained PRs recommended | No |
| Suggested split | Single PR |
| Delivery strategy | ask-always |
| Chain strategy | size-exception |

Decision needed before apply: Yes
Chained PRs recommended: No
Chain strategy: size-exception
400-line budget risk: Low

### Note on Approach

Initial attempt used GNU Stow, which required package restructuring that coupled the repo structure to Stow internals. Reverted to improved `ln -sf` approach — same safety (backup, dry-run, verification) without tool dependency or structural coupling.

## Phase 1: Foundation

- [x] 1.1 Rename `configs/lazygit/config.lazygit.yml` → `config.yml` (bug fix)
- [x] 1.2 Rename `configs/lazydocker/config.lazydocker.yml` → `config.yml` (bug fix)

## Phase 2: Core Implementation

- [x] 2.1 Improve `scripts/add-symlinks.sh`: add backup on existing files, dry-run via `DRY_RUN=1`, set -euo pipefail
- [x] 2.2 Implement symlink verification after each link (readlink check)
- [x] 2.3 Add `-d` flag to `install.sh` optstring (dry-run)

## Phase 3: Integration

- [x] 3.1 Wire `install.sh -d` → `DRY_RUN=1` environment variable for `add-symlinks.sh`

## Phase 4: Cleanup

- [x] 4.1 Delete `scripts/stow-symlinks.sh` (was created during Stow attempt)
- [x] 4.2 Delete `configs/tmux/.stow-local-ignore` (was created during Stow attempt)
- [x] 4.3 Revert package restructuring (5 packages unnested from .config/<pkg>/)

## Phase 5: Verification

- [x] 5.1 Verify `install.sh -d` prints planned operations, modifies nothing
- [x] 5.2 Verify `install.sh -f` produces correct symlink targets
- [x] 5.3 Verify backup dir created with original configs before linking
- [x] 5.4 Update `usage.sh` and `README.md` with `-d` flag documentation (added post-archive)
