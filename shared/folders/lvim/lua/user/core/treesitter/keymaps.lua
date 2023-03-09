local M = {}

M.setup = function()
  local treesitter = lvim.builtin.treesitter

  treesitter.textsubjects.keymaps[";"] = "textsubjects-container-outer"
  treesitter.textsubjects.keymaps["i;"] = "textsubjects-container-inner"
end

return M
