local M = {}

M.setup = function()
  local formatters = reload("lvim.lsp.null-ls.formatters")
  local null_ls_utils = require("user.core.lsp.null-ls.utils")

  formatters.setup({
    { command = "stylua" }, -- cargo install stylua
    { command = "shellharden" }, -- cargo install shellharden
    { command = "prettier" }, -- npm install -g prettier
    {
      command = "rustfmt",
      extra_args = null_ls_utils.rust.formatter.extra_args,
    }, -- rustup component add rustfmt
    {
      command = "sqlfluff",
      extra_args = null_ls_utils.sqlfluff.formatter.extra_args,
    } -- pip install sqlfluff
  })
end

return M
