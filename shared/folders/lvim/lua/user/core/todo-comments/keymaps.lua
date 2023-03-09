local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["T"]["t"] = {
    "<cmd>TodoTelescope<cr>",
    "TODO comments",
  }
end

return M
