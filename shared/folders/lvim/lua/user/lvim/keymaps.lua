local M = {}

M.setup = function()
  -- Leader key
  lvim.leader = "space"

  -- Paste text without yanking replaced one
  lvim.keys.visual_mode["p"] = '"_dP'
end

return M
