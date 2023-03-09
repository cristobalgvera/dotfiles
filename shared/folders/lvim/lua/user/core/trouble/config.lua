local M = {}

M.setup = function()
  local trouble = reload("trouble")
  trouble.setup()
end

return M
