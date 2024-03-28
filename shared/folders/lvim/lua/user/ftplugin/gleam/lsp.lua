local M = {}

M.setup = function()
  require("lvim.lsp.manager").setup("gleam")
end

return M
