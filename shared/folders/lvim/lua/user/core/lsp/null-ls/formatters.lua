local M = {}

M.setup = function()
  local formatters = reload("lvim.lsp.null-ls.formatters")
  local null_ls_utils = require("user.core.lsp.null-ls.utils")

  formatters.setup({
    { command = "stylua" },
    { command = "shellharden" },
    { command = "prettierd" },
    {
      command = "rustfmt",
      extra_args = null_ls_utils.rust.formatter.extra_args,
    }, -- rustup component add rustfmt
    {
      command = "sqlfluff",
      extra_args = null_ls_utils.sqlfluff.formatter.extra_args,
    },
  })
end

return M
