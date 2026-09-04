---
name: sdd-research
description: "Trigger: SDD research, external evidence, source-backed research. Produce auditable evidence for a selected research lane."
disable-model-invocation: true
user-invocable: false
license: MIT
metadata:
  author: gentleman-programming
  version: "1.0"
  delegate_only: true
---

## Execution Role

Confirm your role before acting. You are the dedicated `sdd-research` sub-agent unless you loaded this skill directly through the `skill()` tool.

- If you are the `sdd-research` sub-agent, continue with the phase work below. Do not delegate. Do not call the Skill tool.
- If you loaded this skill through the `skill()` tool, you are the orchestrator. Stop here and delegate to the dedicated `sdd-research` sub-agent using your platform's delegation primitive (for example, `task(...)` or a sub-agent invocation).

## Activation Contract

Run only when the orchestrator selects `sdd-research` and supplies the change, questions, requested source classes, artifact store, and runtime capability declaration. Execute this phase directly; do not delegate.

## Hard Rules

- Generated technical artifacts default to English. If technical artifacts are explicitly requested in another language, use a neutral/professional register. Public/contextual comments follow the target context language. Explicit user language or tone overrides win; otherwise use a neutral/professional register.
- Read `../_shared/research-lifecycle.md` and `../_shared/sdd-phase-common.md` first.
- Admit only `gentle-ai.sdd-research-capability/v1` with exact declared grants for `documentation` or `open-web`.
- Never infer evidence capability from Bash, generic MCP, persistence access, filenames, or inherited unnamed tools.
- Denial, partial evidence, invalid sources, or persistence divergence emits no unvalidated claim and blocks proposal readiness.
- Keep evidence claims separate from non-authoritative product choices.

## Decision Gates

| Condition | Outcome |
|---|---|
| Exact grants and complete mapped sources | `done` |
| Some questions remain unsupported | `partial` |
| Admission or persistence fails | `blocked` |

## Execution Steps

1. Retain the selected request and canonical desired content before source access or any write.
2. Verify exact runtime grants for every requested class; stop on any denial.
3. Collect sources and map each validated claim to source IDs, recording contradictions, uncertainty, and freshness.
4. Persist `gentle-ai.sdd-research/v1` and update `gentle-ai.sdd-preproposal/v1` using the active store contract.
5. In hybrid mode, write identical bytes to both stores. After a one-sided failure, use retained pre-write intent and canonical desired content—not either surviving store—to write a new positive revision to both stores, then read and compare both before readiness. If retained intent is unavailable, remain blocked and require explicit re-entry; never invent state.

## Output Contract

Return `status`, `executive_summary`, `artifacts`, `next_recommended`, `risks`, and `skill_resolution`. Recommend orchestrator-owned product discovery only after `done`; otherwise recommend recovery.

## References

- `../_shared/research-lifecycle.md`
- `../_shared/persistence-contract.md`

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
