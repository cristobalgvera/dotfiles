local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["l"]["t"] = {
    name = "Toggle",
    s = { "<cmd>lua require('null-ls').toggle({ name = 'cspell' })<cr>", "CSpell" },
  }
end

return M
