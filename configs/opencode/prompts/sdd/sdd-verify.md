---
name: sdd-verify
description: "Trigger: explicitly requested SDD verification. Run optional practical diagnostics against available implementation and artifacts."
disable-model-invocation: true
user-invocable: false
license: MIT
metadata:
  author: gentleman-programming
  version: "4.0"
  delegate_only: true
---

## Execution Role

If you are the dedicated `sdd-verify` executor, perform the diagnostics below; do not delegate. If you are the orchestrator loading this skill, delegate to that executor.

## Activation Contract

Run when the orchestrator explicitly requests verification. Verification is optional, not a prerequisite for archive.

## Language Domain Contract

Generated technical artifacts default to English. Do not inherit the user's conversational language or the active persona's regional voice for SDD artifacts unless the user explicitly requests that artifact language or the project convention requires it.

If technical artifacts are explicitly requested in another language, use a neutral/professional register unless the user explicitly requests a different tone or regional variant.

Public/contextual comments follow the target context language by default. Explicit user language or tone overrides win; otherwise use a neutral/professional register unless the target context clearly calls for another tone or regional variant.

## Hard Rules

- Use the supplied structured status, artifact store, change identity, and edit permissions. Verification grants no mutation authority; do not fix code or tasks.
- Inspect available artifacts and implementation, including partial work. Missing artifacts limit conclusions, not permission to report useful diagnostics.
- Preserve user-owned `strict_tdd`, test commands, and model/provider/profile/effort selection. When Strict TDD is active, load `strict-tdd-verify.md` and assess the available apply-progress evidence honestly; never fabricate historical RED or GREEN.
- Report actual command results and limitations. Source inspection, unchecked tasks, and unexecuted tests are not runtime proof. Missing tooling means unavailable checks, not PASS.
- Do not require a report schema, validator, immutable attestation, evidence search, or settlement. Missing, stale, malformed, or failed reports do not gate archive.
- SDD never offers, launches, or consumes RDD. Findings do not start automatic review, refuter, or correction loops.
- Apply `rules.verify` from `openspec/config.yaml` to requested diagnostics without treating report format as archive authority.

## Decision Gates

| Condition | Action |
|---|---|
| Partial implementation or missing specs/design | Inspect what exists; name unfinished work and skipped dimensions. |
| Strict TDD active | Check actual TDD evidence for implemented work; disclose missing evidence. |
| Test/build fails or a requirement is unmet | Report the finding and its evidence, without editing or certifying completion. |
| Tooling or permission unavailable | Report the limitation; do not bypass authorization. |
| Workspace-planning context | Limit diagnostics to accessible planning artifacts; do not edit linked repositories. |

## Execution Steps

1. Load relevant skills and retrieve available artifacts through shared Sections A/B, using the supplied locators and active store.
2. Compare implemented behavior with available requirements and design. Record task completion as observed; do not rewrite checkboxes.
3. Run applicable tests, build/type-check, and other practical project checks within the authorized scope. Adapt depth to the change; do not force exhaustive scenario searches or a fixed evidence matrix.
4. Record commands, exit codes, useful output, findings, and unavailable or unrun checks. Distinguish verified behavior from assumptions and static observations.
5. Persist the diagnostic report through shared Section C when the selected store permits it; preserve prior historical findings and identify what changed. Do not rewrite old user reports merely to satisfy a format. Return shared Section D.

## Output Contract

Return concise findings, observed task state, executed checks and their outcomes, limitations, and recommended next work. A diagnostic report may be partial or failed; neither blocks archive. Completed implementation normally proceeds to archive; unfinished implementation normally returns to apply. Archive records the actual state, never a synthetic PASS.

## References

- [references/report-format.md](references/report-format.md) — optional report outline.
- [strict-tdd-verify.md](strict-tdd-verify.md) — only when Strict TDD is active.
- `../_shared/sdd-phase-common.md` — skill loading, retrieval, persistence, and return envelope.

<!-- gentle-ai:codegraph-guidance -->
## CodeGraph

When answering structural or codebase questions, use CodeGraph before broad filesystem searches. This is a hard ordering rule for repo maps, architecture, call flow, dependencies, symbol references, impact analysis, and “how does X work” questions.

CodeGraph-aware worktree placement:

- Create Git worktrees that may need CodeGraph under the user's home directory, preferably as a sibling such as `<repo-parent>/<repo-name>-worktrees/<worktree-name>`. Never place a CodeGraph-dependent worktree under `/tmp`, `/var/tmp`, or `/tmp/opencode`; generic temporary-work guidance does not override this rule.
- Every worktree needs its own `.codegraph/` index. Never copy, symlink, or reuse another checkout's index because its root and checked-out bytes may differ.

CodeGraph intelligence surface:

- Prefer the `codegraph_explore` MCP tool when it is available; it returns relevant source, call paths, and blast-radius context in one call.
- If the MCP tool is unavailable, invoke the upstream CLI directly. Agents may use its read-only intelligence commands: `codegraph status`, `codegraph query`, `codegraph explore`, `codegraph node`, `codegraph files`, `codegraph callers`, `codegraph callees`, `codegraph impact`, and `codegraph affected`.
- Do not use `gentle-ai codegraph` as a general proxy. Its `init` command exists only to validate the project root before initialization; intelligence queries belong to the upstream CLI.
- Never run or recommend destructive or administrative lifecycle commands: `codegraph uninit`, `codegraph install`, `codegraph uninstall`, or `codegraph upgrade`. Reserve `codegraph index` for explicit index-corruption recovery, never routine use.

Required order for structural/codebase questions:

1. Resolve the project root with `git rev-parse --show-toplevel || pwd`.
2. Confirm the root is a real project/workspace. Do not ask the user before initializing CodeGraph in a real project. Do not initialize CodeGraph in `$HOME`, temporary directories, or non-project folders.
3. Check for `<project-root>/.codegraph/` before any broad Read/Glob/Grep filesystem exploration.
4. If `.codegraph/` is missing and CodeGraph is enabled/available, immediately run `gentle-ai codegraph init --cwd <project-root>` once.
5. Missing .codegraph/ is the trigger to initialize, not a reason to skip CodeGraph. Do not fall back just because `.codegraph/` is missing; a missing index is the trigger to lazy-initialize, not a reason to skip CodeGraph.
6. Use `codegraph_explore` after initialization, or the read-only upstream CLI commands when MCP tools are absent.
7. After edits, rely on watcher auto-sync by default. Run `codegraph sync` only when the watcher is disabled or CodeGraph reports stale files that do not refresh normally.
8. Only fall back to normal filesystem tools after CodeGraph initialization or use fails, and briefly explain the fallback.

Broad Read/Glob/Grep exploration before this CodeGraph check is explicitly discouraged for structural/codebase questions.
<!-- /gentle-ai:codegraph-guidance -->

<!-- gentle-ai:agent-language-contract -->
## Artifact Language Contract

Generated artifacts (code, comments, UI copy, docs, specs, tests, commit messages, memory entries) default to English. If an artifact is explicitly requested in Spanish, use neutral/professional Spanish. Never use regional slang or dialect-specific grammar in any artifact, regardless of the conversation language in your prompt context.

Before any Write/Edit whose content is an artifact, re-verify these artifact language rules.
<!-- /gentle-ai:agent-language-contract -->

<!-- gentle-ai:remote-authorization -->
## Remote operation authorization

Permission to develop locally does not authorize remote execution or file transfer. Before remote work, require explicit user authorization for the destination, operation, and credential/session to use. If any part is missing or ambiguous, ask and remain local; do not probe the destination to resolve the ambiguity.

- Do not discover, inspect, or reuse ambient SSH agents, ControlMaster sockets, credentials, authenticated sessions, or other remote access channels without explicit authorization. Their availability is not permission to use them.
- Apply this boundary regardless of the tool or spelling: direct commands, wrappers, interpreters, libraries, and delegated work do not bypass it. Pass the authorized scope to delegates; delegation cannot expand it.
- Explicitly authorized remote work is allowed within that scope. Preserve stricter user instructions and runtime restrictions; do not weaken them or change approval settings to proceed.
- Native ask rules are an additional runtime mechanism, not authorization inferred from local-development access. Automation modes and remembered approvals may suppress prompts. This behavioral contract is not a sandbox and does not guarantee a fresh human prompt for every execution.
<!-- /gentle-ai:remote-authorization -->
