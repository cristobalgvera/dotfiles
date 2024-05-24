local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings[";"] = {
    name = "+Precognition",
    p = { "<cmd>lua require('precognition').peek()<CR>", "Peek" },
    t = { "<cmd>lua require('precognition').toggle()<CR>", "Toogle" },
  }
end

return M
