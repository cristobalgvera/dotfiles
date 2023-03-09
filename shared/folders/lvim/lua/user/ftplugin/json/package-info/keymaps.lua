local M = {}

M.setup = function()
  local which_key = require("user.ftplugin.config.which-key")

  local mappings = {
    n = {
      name = "+Package",
      t = { "<cmd>lua require('package-info').toggle()<cr>", "Toggle package versions" },
      u = { "<cmd>lua require('package-info').update()<cr>", "Update package" },
      d = { "<cmd>lua require('package-info').delete()<cr>", "Delete package" },
      i = { "<cmd>lua require('package-info').install()<cr>", "Install package" },
      c = { "<cmd>lua require('package-info').change_version()<cr>", "Change package version" },
    },
  }

  which_key.setup(mappings)
end

return M
