local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["T"]["n"] = {
    "<cmd>NoiceTelescope<cr>",
    "Notifications",
  }
end

return M
