local M = {}

M.setup = function()
  local hardtime = reload("hardtime")

  hardtime.setup({
    disable_mouse = false,
  })
end

return M
