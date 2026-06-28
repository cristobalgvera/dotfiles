## Exploration: Dotfiles Improvement — Scalable Config Management

### Current State

The dotfiles repo is a Bash-script-based system with two entry points:

- **`install.sh -f`** → calls `scripts/add-symlinks.sh` → links config files from `configs/` to their target locations via `ln -sf`.
- **`install.sh -a`** → calls `scripts/install-apps.sh` → installs Homebrew (if missing), Rust, Oh My Zsh, then runs 20+ brew formulas + 5 casks, installs mise tools (11 tools pinned to exact versions), and clones 4 Oh My Zsh plugins.

The `configs/` directory contains 12 domains: fonts, git, lazydocker, lazygit, mise, nvim, opencode, starship, tmux, tuxedo, wezterm, zsh.

**Key files:**
- `install.sh` — entry point, delegates to scripts/ based on flags
- `scripts/add-symlinks.sh` — 75 lines, manual `ln -sf` for every config file
- `scripts/install-apps.sh` — 138 lines, procedural app installation
- `scripts/brew-install.sh` — 43 lines, brew helper (idempotency checks)

The openspec/ directory exists with `config.yaml` but `specs/` and `changes/archive/` are empty — no SDD specs have been defined yet.

### Affected Areas
- `install.sh` — entry point, needs refactoring for robustness
- `scripts/add-symlinks.sh` — brittle manual symlink listing, no dry-run, no backup
- `scripts/install-apps.sh` — no dependency ordering, hardcoded macOS paths, no pre-flight checks
- `scripts/brew-install.sh` — functional but limited (no cask upgrade, no brew cleanup integration)
- `scripts/usage.sh` — minimal help
- `configs/git/.gitconfig` — hardcoded personal name/email (privacy concern for work machines)
- `configs/zsh/.zshenv.secret` — empty API key committed to repo (bad pattern — encourages secret leakage)
- `configs/fonts/DankMonoNerdFontMono/` — 3 OTF font binaries (~3-5MB) versioned in the repo
- `configs/tuxedo/config.toml` — previously had leaked `share_token` (recently removed via engram history)
- `.gitmodules` — only 1 submodule (tmux), manual management
- `openspec/specs/` — empty, no formal spec coverage yet

### Issues/Bugs Found

1. **No dependency ordering in install-apps.sh**: `install_mise_tools` calls `mise install` via `~/.local/bin/mise`, but this only works if mise was already installed via brew in `install_brew_apps`. If `-a` is the only flag, brew installs happen after curl apps but before mise tools — this actually works in the current ordering, BUT `install_curl_apps` doesn't source the brew shellenv after installing Homebrew on fresh machines (it does, but only within the function scope via `eval`).

2. **Hardcoded macOS paths**: `add-symlinks.sh` uses `~/Library/Application Support/lazygit/config.yml` — this is macOS-only. On Linux, these paths differ entirely.

3. **No backup on symlink creation**: `ln -sf` silently overwrites any existing file/symlink at the target path. If a user already has a custom `~/.gitconfig`, it's gone.

4. **No validation after symlinking**: The script creates symlinks but never verifies they resolve correctly (broken symlinks if targets move).

5. **No pre-flight checks**: No validation that required tools (curl, git) exist before attempting operations that depend on them.

6. **No idempotency verification**: While individual brew installs check `brew list --versions`, there's no overall "is everything set up?" check.

7. **Font files in repo**: 3 OTF binary files versioned in `configs/fonts/`. This balloons repo size and complicates cloning.

8. **Secret in version control**: `.zshenv.secret` has an empty `GEMINI_API_KEY` — the file itself is a pattern that encourages committing secrets. The `share_token` in tuxedo config.toml was recently removed.

9. **Submodule update via git, not script**: `install_apps` calls `git submodule update --init --recursive`, but there's no error handling if this fails (e.g., network issues).

### Approaches

1. **Refactor current system + GNU Stow** — Replace manual `ln -sf` calls with GNU Stow. Each `configs/` subdirectory is already a valid Stow package. Add pre-flight checks, backup, dry-run, and validation to scripts.
   - **Pros**: Minimal structural changes, Stow is mature and well-known, no config file rewriting needed, existing `configs/` structure is already Stow-compatible, `stow --delete` handles cleanup
   - **Cons**: Adds one more tool dependency (stow), no template support, no encryption for secrets, still macOS-biased
   - **Effort**: Low

2. **chezmoi migration** — Rewrite bootstrap to use `chezmoi` for full lifecycle management. Uses Go templates for per-machine/host customization, age encryption for secrets, `chezmoi diff` for preview, `chezmoi apply` for idempotent application, `chezmoi init` for bootstrapping new machines.
   - **Pros**: Battle-tested, cross-platform, secret management built-in, template support for conditional config (work vs personal), dry-run/diff/apply workflow, one-command bootstrap from a fresh machine
   - **Cons**: Requires migrating all dotfiles to chezmoi's directory structure and template syntax, learning curve, Go dependency
   - **Effort**: Medium

3. **yadm** — Uses git as its backend (dotfiles repo IS the yadm repo). Supports templating (env vars), encryption (GPG), bootstrap hooks via `.config/yadm/bootstrap`.
   - **Pros**: Git-native, simpler mental model than chezmoi, works with existing repo structure, less overhead
   - **Cons**: Less ecosystem than chezmoi, GPG setup for encryption is more manual than age, limited diff/preview capabilities
   - **Effort**: Low-Medium

4. **Nix / nix-darwin** — Full declarative system management via Nix. Manages packages, dotfiles, launchd services, and system settings.
   - **Pros**: Pure reproducibility, rollback, entire system config in one place
   - **Cons**: Very steep learning curve, overkill for just dotfiles, macOS support through nix-darwin has quirks, Nix language itself is a significant investment
   - **Effort**: Very High

### Recommendation

**Incremental approach: Phase 1 with GNU Stow, Phase 2 as chezmoi if needed.**

The `configs/` directory already maps 1:1 to Stow packages. The immediate wins are:
1. Replace `add-symlinks.sh` with `stow` commands — each config directory is a stow package, `stow -D` handles cleanup, `stow -n` gives dry-run
2. Add pre-flight checks and error handling to `install-apps.sh`
3. Remove font binaries from repo and install via brew (they exist as casks or via nerd-fonts)
4. Add `.zshenv.secret` to `.gitignore` and provide a `.zshenv.secret.example` template
5. Add `--dry-run` flag to `install.sh`
6. Add backup logic before replacing existing config files

This gives the most value for the least disruption. The user can migrate to chezmoi later if they need templates, encryption, or cross-platform support.

### Risks
- **Tool dependency**: Stow must be installed (via brew) before `-f` can work — adds a bootstrap ordering constraint
- **Existing symlinks**: Transition from manual symlinks to stow requires cleaning up existing symlinks first (stow needs to manage them, not co-exist with manually created ones)
- **Submodule complexity**: The tmux submodule inside `configs/tmux/.tmux/` sits inside a Stow package — need to ensure stow doesn't try to manage submodule internals
- **Scope creep**: The exploration might tempt fixing ALL issues at once. Recommend prioritizing: (1) Stow migration, (2) secrets hygiene, (3) cross-platform readiness in later phases

### Ready for Proposal
**Yes** — the analysis is complete. The recommended approach is clear (Phase 1: GNU Stow refactor with safety improvements). The orchestrator should tell the user:
- The current approach works but is fragile and macOS-only
- A Stow-based refactor is the fastest path to improvement with the least config rewriting
- Secrets hygiene and font management should be tackled immediately
- A full chezmoi migration can be evaluated later if cross-platform support becomes a priority
