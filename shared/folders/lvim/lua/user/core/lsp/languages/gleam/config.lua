local M = {}

M.setup = function()
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
    "gleam",
  })
end

return M
