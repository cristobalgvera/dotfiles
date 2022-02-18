local util = require("user.util")
local focus = util.require("focus")

focus.setup({
  excluded_filetypes = {
    "toggleterm",
    "alpha",
    "dashboard",
    "NvimTree",
    "Outline",
  },
  excluded_buftypes = {
    "help",
    "nofile",
    "prompt",
    "popup",
  },
})
