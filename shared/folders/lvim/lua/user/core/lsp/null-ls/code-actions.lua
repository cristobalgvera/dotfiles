local code_actions = reload("lvim.lsp.null-ls.code_actions")

code_actions.setup({
  { command = "shellcheck" }, -- brew install shellcheck
})
