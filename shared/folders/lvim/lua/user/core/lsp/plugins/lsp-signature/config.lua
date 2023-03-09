local M = {}

M.setup = function()
  local lsp_signature = reload("lsp_signature")

  local MAX_WIDTH = math.max(math.floor(vim.o.columns * 0.7), 100)
  local MAX_HEIGHT = math.max(math.floor(vim.o.lines * 0.3), 30)

  lsp_signature.setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded",
    },
    hint_prefix = " ", -- virtual text prefix icon
    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
    transparency = nil, -- disabled by default, allow floating win transparent value 1~100
    toggle_key = "<C-s>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    move_cursor_key = "<M-c>", -- imap, use nvim_set_current_win to move cursor between current win and floating
    max_height = MAX_HEIGHT, -- max height of signature floating_window, if content is more than max_height, can scroll down
    max_width = MAX_WIDTH, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  })
end

return M
