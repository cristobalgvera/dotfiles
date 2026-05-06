---
source: OpenCode Docs (opencode.ai/docs/config)
library: OpenCode
package: opencode
topic: repo-level config structure (.opencode)
fetched: 2026-05-05T00:00:00Z
official_docs: https://opencode.ai/docs/config/
---

# OpenCode repo-level configuration structure

## Primary repo config files

- `opencode.json` (or `opencode.jsonc`): project config file placed at project root.
  - Uses schema: `https://opencode.ai/config.json`
  - Example:
    ```json
    {
      "$schema": "https://opencode.ai/config.json",
      "model": "anthropic/claude-sonnet-4-5",
      "autoupdate": true,
      "server": {
        "port": 4096
      }
    }
    ```
- `tui.json` (or `tui.jsonc`): TUI-specific config alongside `opencode.json` in project root.
  - Uses schema: `https://opencode.ai/tui.json`
  - Example:
    ```json
    {
      "$schema": "https://opencode.ai/tui.json",
      "scroll_speed": 3,
      "diff_style": "auto",
      "mouse": true
    }
    ```

## Repo-level `.opencode/` directory (project context)

The `.opencode` directory can hold additional project-scoped definitions. These are merged into config after `opencode.json` and used for structured content like agents/commands/etc.

Plural directory names are preferred (singular supported for backward compatibility):

- `.opencode/agents/`
- `.opencode/commands/`
- `.opencode/modes/`
- `.opencode/plugins/`
- `.opencode/skills/`
- `.opencode/tools/`
- `.opencode/themes/`

Docs note: `.opencode` directories are loaded in the precedence order after `opencode.json` and before inline/managed configs.

## Config precedence (relevant to repo-level)

Order (later overrides earlier for conflicting keys, non-conflicting merge):

1. Remote config (`.well-known/opencode`)
2. Global config (`~/.config/opencode/opencode.json`)
3. Custom config (`OPENCODE_CONFIG` env var)
4. **Project config** (`opencode.json` in project root)
5. **`.opencode` directories** (agents, commands, plugins, etc.)
6. Inline config (`OPENCODE_CONFIG_CONTENT` env var)
7. Managed config files (system-managed)
8. macOS managed preferences (highest priority)

## Required fields

No explicit required fields are listed for `opencode.json`. The docs show `$schema` as recommended for editor validation but do not mark it required.

Key examples shown in docs include:

- `model`, `provider`, `small_model`
- `server` (port, hostname, mdns, cors)
- `tools` (enable/disable)
- `agent`, `default_agent`
- `command` (custom commands)
- `permission` (tool permissions)
- `formatter`, `lsp`, `mcp`, `plugin`
- `instructions` (paths/globs)
- `disabled_providers` / `enabled_providers`
- `snapshot`, `autoupdate`, `compaction`, `watcher`, `experimental`

## Example: agent defined in config

```json
{
  "$schema": "https://opencode.ai/config.json",
  "agent": {
    "code-reviewer": {
      "description": "Reviews code for best practices and potential issues",
      "model": "anthropic/claude-sonnet-4-5",
      "prompt": "You are a code reviewer. Focus on security, performance, and maintainability.",
      "tools": {
        "write": false,
        "edit": false
      }
    }
  }
}
```

## Example: project-level commands

```json
{
  "$schema": "https://opencode.ai/config.json",
  "command": {
    "test": {
      "template": "Run the full test suite with coverage report and show any failures.\nFocus on the failing tests and suggest fixes.",
      "description": "Run tests with coverage",
      "agent": "build",
      "model": "anthropic/claude-haiku-4-5"
    }
  }
}
```
