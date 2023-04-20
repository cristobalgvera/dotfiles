local M = {}

M.setup = function()
  local scrollbar = reload("scrollbar")

  scrollbar.setup({
    show_in_active_only = true,
    hide_if_all_visible = true,
    marks = {
      GitAdd = { text = "│" },
      GitChange = { text = "│" },
      GitDelete = { text = "│" },
    },
    handlers = {
      cursor = false,
      diagnostic = true,
      gitsigns = true,
      handle = true,
      search = false,
      ale = false,
    },
    excluded_filetypes = {
      "alpha",
    },
  })
end

return M
