local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["H"] = {
    "<cmd>Hardtime toggle<cr>",
    "Hardtime toggle",
  }
end

return M
