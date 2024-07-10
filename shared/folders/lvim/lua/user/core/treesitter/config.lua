local M = {}

local function setup_autotag()
  local autotag = reload("nvim-ts-autotag")

  autotag.setup()
end

M.setup = function()
  local treesitter = lvim.builtin.treesitter

  treesitter.auto_install = true

  treesitter.textsubjects.enable = true

  setup_autotag()
end

return M
