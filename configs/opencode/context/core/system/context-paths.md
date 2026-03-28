<!-- Context: core/context-paths | Priority: low | Version: 1.0 | Updated: 2026-02-15 -->

---
id: context-paths
name: Context File Path Resolution
---

# Context File Path Resolution

## Resolution Order

Context files are resolved with a local-first strategy:

1. **Local core context** (`{context_root}/core/`) — preferred source
2. **Global core fallback** (`~/.config/opencode/context/core/`) — used only when local core is missing

`project-intelligence/` is always local and should be treated as project-specific context.

## What Goes Where

| Content Type | Recommended Location | Why |
|---|---|---|
| **Project Intelligence** (tech stack, patterns, naming) | Local `{context_root}/project-intelligence/` | Project-specific, committed to git, shared with team |
| **Core Standards** (code-quality, docs, tests) | Wherever OAC was installed | Universal standards, same across projects |
| **Personal Defaults** (your preferred patterns) | Global `~/.config/opencode/context/` | Personal coding style across projects (avoid overriding project intelligence) |

## How Merging Works

- **Core files**: local first, then global fallback if local core is unavailable
- **Project intelligence**: always local; no global fallback
- If local and global both exist for core files, local wins

**Example**: User installs OAC globally (core standards at `~/.config/opencode/context/core/`) and has local project context at `{context_root}/project-intelligence/`. Agent uses local project intelligence and resolves core via local-first with global fallback.

## Path Configuration

```json
{
  "paths": {
    "local": "{context_root}",
    "global": "~/.config/opencode/context"
  }
}
```

Set `"global": false` to disable global context loading.

## Environment Variable Override

The installer supports `OPENCODE_INSTALL_DIR` to override the install location:

```bash
export OPENCODE_INSTALL_DIR=~/custom/path
bash install.sh developer
```

OpenCode itself supports `OPENCODE_CONFIG_DIR` for a custom config directory (see [OpenCode docs](https://opencode.ai/docs/config/)). If set, resolve `{context_root}` from that configured location.

## Migrating Global to Local

If you installed globally but want project-specific context:

```bash
/context migrate
```

This copies `project-intelligence/` from global (`~/.config/opencode/context/`) to local (`{context_root}/`), so your project patterns are committed to git and shared with your team. See `/context migrate` for details.

## Common Scenarios

### Scenario 1: Everything Local (Development / Repo Maintainer)
- OAC installed locally via `bash install.sh developer`
- All context in `{context_root}/`
- Committed to git, team shares everything

### Scenario 2: Global Install + Local Project Intelligence
- OAC installed globally via `bash install.sh developer --install-dir ~/.config/opencode`
- Core standards at `~/.config/opencode/context/core/`
- Run `/add-context` in project → creates `{context_root}/project-intelligence/` locally
- Project intelligence committed to git, core standards come from global

### Scenario 3: Global Personal Defaults
- Run `/add-context --global` to save personal coding patterns
- These apply to ALL projects as fallback
- Any project can override with local `{context_root}/project-intelligence/`
