local M = {}

M.setup = function()
  local linters = reload("lvim.lsp.null-ls.linters")
  local null_ls_utils = require("user.core.lsp.null-ls.utils")

  linters.setup({
    { command = "markdownlint" },
    { command = "shellcheck" },
    { command = "eslint_d" },
    {
      command = "sqlfluff",
      extra_args = null_ls_utils.sqlfluff.linter.extra_args,
    },
  })
end

return M
