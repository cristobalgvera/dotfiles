local M = {}

M.setup = function()
  local surround = reload("nvim-surround")
  surround.setup()
end

return M
