local M = {}

M.setup = function()
  local treesitter = lvim.builtin.treesitter

  treesitter.auto_install = true

  treesitter.autotag.enable = true

  treesitter.textsubjects.enable = true
end

return M
