local M = {}

M.setup = function()
  local formatters = reload("lvim.lsp.null-ls.formatters")
  local null_ls_utils = require("user.core.lsp.null-ls.utils")

  formatters.setup({
    { command = "stylua" }, -- cargo install stylua
    { command = "shellharden" }, -- cargo install shellharden
    { command = "prettierd" }, -- npm install -g @fsouza/prettierd
    {
      command = "rustfmt",
      extra_args = null_ls_utils.rust.formatter.extra_args,
    }, -- rustup component add rustfmt
  })
end

return M
