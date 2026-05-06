<!-- Context: dotfiles/guides/adding-new-config | Priority: high | Version: 1.0 | Updated: 2026-05-05 -->

# Adding a New Config

## Checklist

- [ ] Add config under `configs/{tool}/`
- [ ] Update `scripts/add-symlinks.sh`
- [ ] Add entry to `dotfiles/lookup/config-map.md`
- [ ] Ensure no secrets are committed
- [ ] If secrets required, add instructions for `~/.zshrc.local`

## Notes

- Keep configs portable across macOS machines
- Avoid user-specific absolute paths
