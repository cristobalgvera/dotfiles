local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["P"] = {
    name = "+Popup",
    d = { "<cmd>lua _Lazydocker_toggle()<cr>", "Lazydocker" },
    g = { "<cmd>lua _Lazygit_toggle()<cr>", "Lazygit" },
    t = { "<cmd>ToggleTerm<cr>", "Terminal" },
  }
end

return M
