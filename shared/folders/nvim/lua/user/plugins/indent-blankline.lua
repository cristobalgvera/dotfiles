local util = require("user.util")
local indent_blankline = util.require("indent_blankline")

indent_blankline.setup({
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  buftype_exclude = {
    "terminal",
    "nofile",
  },
  filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
  },
})
