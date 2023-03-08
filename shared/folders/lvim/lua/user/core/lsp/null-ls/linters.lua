local linters = reload("lvim.lsp.null-ls.linters")

linters.setup({
  { command = "markdownlint" }, -- npm install -g markdownlint
  { command = "shellcheck" }, -- brew install shellcheck
  { command = "eslint_d" }, -- npm install -g eslint_d
})
