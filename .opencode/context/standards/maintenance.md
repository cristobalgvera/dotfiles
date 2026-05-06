<!-- Context: dotfiles/standards/maintenance | Priority: high | Version: 1.0 | Updated: 2026-05-05 -->

# Maintenance Cadence

## Quick Reference

- **Monthly**: Review brew formulae/casks
- **Quarterly**: Review mise tools + configs
- **When adding tools**: Update install scripts + docs

---

## Routine Checklist

### Monthly
- [ ] `brew update` and review outdated formulae/casks
- [ ] Remove unused tools from `scripts/install-apps.sh`

### Quarterly
- [ ] Review `mise` tool versions
- [ ] Check submodules are current (tmux)
- [ ] Validate all symlinks still resolve

### On Change
- [ ] Update `dotfiles/lookup/config-map.md`
- [ ] Document decisions in `project-intelligence/decisions-log.md`
- [ ] Update README if onboarding changes
