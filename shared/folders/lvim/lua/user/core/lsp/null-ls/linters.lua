local linters = reload("lvim.lsp.null-ls.linters")

linters.setup({
  { command = "markdownlint" }, -- yarn global add markdownlint
  { command = "shellcheck" }, -- brew install shellcheck
  {
    command = "eslint",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  }, -- npm install eslint
})
