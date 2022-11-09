local code_actions = require_safe("lvim.lsp.null-ls.code_actions")

code_actions.setup({
  { command = "shellcheck" }, -- brew install shellcheck
})
