# OpenCode V2 Upgrade

Objective: upgrade the OpenCode host from 1.19.6 to the latest stable 2.x and migrate the Gentle-AI managed config into the dotfiles source tree.
Branch: `feat/opencode-v2-upgrade`. Delivery strategy: `ask-on-risk` (local work-unit commits only; no push, PR, or merge). Test runner: `opencode --version`, `gentle-ai doctor`, `gentle-ai sync --dry-run`, plugin-load log inspection.

## Specs

S1. Upgrade the host without breaking the Gentle-AI harness.
Verbatim request: "I had installed OpenCode 1.19.6 and I want to upgrade it to v2.0+"
Verbatim context: "I also had installed Gentle-AI harness"
Verbatim problem: "I can't upgrade it because it conflicts, help me to define a way"
Acceptance: `opencode --version` reports 2.x; `gentle-ai doctor` reports no failed checks; managed plugins load on V2 with no `PluginModule.LoadError`; the V2 relay contract is declared.

S2. Keep the user's dotfiles config as the single source of truth.
Verbatim request: "Do that, but also migrate my own config, since I'm storing it into mi dotfiles repository and symlinking that folder into `~/.config`."
Verbatim request: "You can just do what you say and, at the end, modify my files with the required config. If my folder at `./config/opencode` has the proper config, I can symlink it later to the right location."
Evidence: `~/.config/opencode` and `~/.config/mise` are already symlinks into `configs/`; the repo path is `configs/opencode` (not `config/opencode`). Acceptance: after the upgrade, files under `configs/opencode` and `configs/mise/config.toml` are the V2-ready config.

S3. Execute the accepted plan.
Verbatim approval: "It sounds right."
Verbatim instruction: "Let's upgrade our tools"

## Tasks

T1 | S1 | inline | Backup baseline and run `gentle-ai sync --dry-run` | done — e6fe7be
T2 | S1 | inline | Install pinned `@opencode/plugin@2.0.4`, use `--force` only on ERESOLVE | done — e6fe7be
T3 | S1,S2 | inline | Bump `configs/mise/config.toml` opencode pin to latest stable 2.x | done — e6fe7be
T4 | S1,S2 | inline | Run `gentle-ai sync`, regenerate V2 managed plugins and relay contract | done — e6fe7be
T5 | S1 | inline | Verify live upgrade: version, doctor, plugin loads, relay contract | done — e6fe7be
T6 | S2 | inline | Confirm repo `configs/opencode` is the V2-ready source; handle ignored SDK files | done — e6fe7be

## Log

L1 (2026-11-21): "I had installed OpenCode 1.19.6 and I want to upgrade it to v2.0+

I also had installed Gentle-AI harness

I can't upgrade it because it conflicts, help me to define a way"

L2 (2026-11-21): "It sounds right.

Do that, but also migrate my own config, since I'm storing it into mi dotfiles repository and symlinking that folder into `~/.config`.

You can just do what you say and, at the end, modify my files with the required config. If my folder at `./config/opencode` has the proper config, I can symlink it later to the right location.

Let's upgrade our tools"

L3 (2026-11-21): Verification evidence. Fresh shell (`zsh -lic`) resolves `opencode v2.3.2`; `mise install opencode` installed 2.3.2. `gentle-ai sync --dry-run` clean; host confirmed 2.3.2 by direct version probe. First real `gentle-ai sync` failed with `telemetry runtime ownership conflict in /Users/cristobalgvera/.config/opencode; custom files preserved`; stale V1 `plugins/telemetry-runtime.ts` and `.gentle-ai-telemetry-runtime.json` were moved to `/var/folders/hf/dh19sq2s6pv186366j7vylzr0000gn/T/opencode/v2-upgrade-baseline-20261121-184219/stale-telemetry/`, then sync succeeded. `gentle-ai doctor`: 7 passed, 0 failed, 1 expected duplicate-PATH warning (real 2.3.2 binary plus mise shim). `opencode plugin list` registers `engram`, four `gentle-ai.*` V2 plugins and `opencode.wakatime 1.4.0`. Post-sync `~/.local/share/opencode/log/opencode.log` boot at 21:45:53 loaded all plugins without `PluginModule.LoadError`. Native `gentle-ai review assess` returned `risk: high`, `review_due: true`, but the command failed because this running host is still OpenCode 1.19.6, so immutable V2 review is unavailable in this session; report as unavailable, do not disable RDD. Smoke boot used `zsh -lic 'exec opencode serve --port 40999'`; `--standalone` is not a valid flag. OpenCode 2.x generated `cli.json` (migrated from `tui.json`) and `service.json` (runtime password); `service.json` is untracked and ignored. Independent verification found its generated password in an earlier local commit; the unpushed branch was rewritten so no commit holds that blob, and `git log --all -p -- configs/opencode/service.json` no longer shows any password. SDK pin lives in gitignored `configs/opencode/package.json` (`@opencode/plugin@2.0.4`, installed with `--force` after `ERESOLVE`); no secrets remain in the branch history. Local commits only; no push, PR, or merge.
