local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["T"]["name"] = "+Telescope"
  which_key.mappings["T"]["i"] = nil

  which_key.mappings["f"] = {
    "<cmd>Telescope find_files<cr>",
    "Find files",
  }
end

return M
