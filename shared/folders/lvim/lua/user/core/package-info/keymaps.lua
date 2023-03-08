local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["n"] = {
    name = "+Package",
    t = { "<cmd>lua require('package-info').toggle()<cr>", "Toggle package versions" },
    u = { "<cmd>lua require('package-info').update()<cr>", "Update package" },
    d = { "<cmd>lua require('package-info').delete()<cr>", "Delete package" },
    i = { "<cmd>lua require('package-info').install()<cr>", "Install package" },
    c = { "<cmd>lua require('package-info').change_version()<cr>", "Change package version" },
  }
end

return M
