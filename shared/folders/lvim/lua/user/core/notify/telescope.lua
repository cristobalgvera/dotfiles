local M = {}

M.setup = function()
  local telescope_utils = require("user.core.telescope.utils")
  telescope_utils.add_extension("notify")
end

return M
