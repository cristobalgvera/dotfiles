local M = {}

M.setup = function()
  lvim.format_on_save.enabled = true
  lvim.format_on_save.pattern = "*.lua"
end

return M
