local util = require("user.util")
local focus = util.require("focus")

focus.setup({
	excluded_filetypes = { "toggleterm" },
	excluded_buftypes = { "help", "nofile", "prompt", "popup" },
})
