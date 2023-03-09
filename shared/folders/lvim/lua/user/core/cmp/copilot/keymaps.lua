local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["C"] = {
    name = "+Copilot",
    ["a"] = { "<cmd>Copilot auth<cr>", "Authenticate" },
    ["p"] = { "<cmd>Copilot panel<cr>", "Open panel" },
    ["t"] = { "<cmd>Copilot toggle<cr>", "Toggle" },
  }
end

return M
