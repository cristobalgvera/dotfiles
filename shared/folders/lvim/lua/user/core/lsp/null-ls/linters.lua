local M = {}

M.setup = function()
  local linters = reload("lvim.lsp.null-ls.linters")

  linters.setup({
    { command = "markdownlint" }, -- npm install -g markdownlint-cli
    { command = "shellcheck" }, -- brew install shellcheck
    { command = "eslint_d" }, -- npm install -g eslint_d
  })
end

return M
