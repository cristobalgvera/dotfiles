local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["T"]["name"] = "+Telescope"
  which_key.mappings["T"]["i"] = nil
end

return M
