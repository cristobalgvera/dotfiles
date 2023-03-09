local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings.g["t"] = {
    "<cmd>Gitsigns toggle_current_line_blame<cr>",
    "Toggle current line blame",
  }
end

return M
