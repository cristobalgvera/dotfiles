local util = require("user.util")
local close_buffers = util.require("close_buffers")
local bufferline = util.require("bufferline")

close_buffers.setup({
  preserve_window_layout = { "this" },
  next_buffer_cmd = function(windows)
    bufferline.cycle(1)
    local bufnr = vim.api.nvim_get_current_buf()

    for _, window in ipairs(windows) do
      vim.api.nvim_win_set_buf(window, bufnr)
    end
  end,
})
