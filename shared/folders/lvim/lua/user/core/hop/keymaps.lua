local M = {}

M.setup = function()
  lvim.keys.normal_mode["f"] = "<cmd>HopChar1<CR>"
  lvim.keys.normal_mode["F"] = "<cmd>HopWord<CR>"
end

return M
