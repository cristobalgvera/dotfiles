local M = {}

M.setup = function()
  lvim.keys.normal_mode["-"] = "<cmd>Oil<CR>"
end

return M
