local linters = require_safe("lvim.lsp.null-ls.linters")

linters.setup({
  { command = "markdownlint" }, -- yarn global add markdownlint
  { command = "shellcheck" }, -- brew install shellcheck
})
