---@type LazySpec
return {
  "ray-x/lsp_signature.nvim",
  opts = function(_, opts)
    local utils = require "astrocore"

    return utils.extend_tbl(opts, {
      toggle_key = "<M-s>",
      select_signature_key = "<M-n>",
      move_cursor_key = "<M-a>",
      floating_window = false,
      max_width = math.max(math.floor(vim.o.columns * 0.7), 100),
      max_height = math.max(math.floor(vim.o.lines * 0.3), 30),
      hint_prefix = " ",
    })
  end,
}
