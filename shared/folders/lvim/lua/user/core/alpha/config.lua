local M = {}

M.setup = function()
  local alpha_utils = require("user.core.alpha.utils")

  local headers = alpha_utils.headers
  local current_session_header = alpha_utils.split_string_by_line(headers[math.random(#headers)])

  lvim.builtin.alpha.dashboard.section.header.val = current_session_header
end

return M
