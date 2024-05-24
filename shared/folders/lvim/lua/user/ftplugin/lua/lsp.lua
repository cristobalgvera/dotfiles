local M = {}

M.setup = function()
  require("lvim.lsp.manager").setup("lua_ls")
end

return M
