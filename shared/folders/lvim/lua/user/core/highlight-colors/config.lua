local M = {}

M.setup = function()
  local highlight_colors = reload("nvim-highlight-colors")

  highlight_colors.setup({
    enable_tailwind = true,
  })
end

return M
