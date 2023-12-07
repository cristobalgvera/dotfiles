local M = {}

M.setup = function()
  local utils = require("user.utils")

  lvim.format_on_save.enabled = true
  lvim.format_on_save.timeout = utils.constants.FORMAT_TIMEOUT
  lvim.format_on_save.pattern = "*"
end

return M
