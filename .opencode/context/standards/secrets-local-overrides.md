<!-- Context: dotfiles/standards/secrets-local-overrides | Priority: critical | Version: 1.0 | Updated: 2026-05-05 -->

# Secrets & Local Overrides

## Quick Reference

- **Local overrides live in**: `~/.zshrc.local`
- **Never commit secrets** to this repo
- **Configs in repo should be safe to symlink**

---

## Policy

1. Store secrets and machine-specific overrides in `~/.zshrc.local`.
2. Keep repo configs **portable** and **non-sensitive**.
3. Avoid adding new secret files to `configs/`.
4. If a tool requires secrets, document the manual step in a guide.

---

## When Adding New Config Files

- Verify no credentials are present
- If credentials are required, add instructions in:
  - `dotfiles/guides/adding-new-config.md`
  - `dotfiles/guides/install-flow.md`
