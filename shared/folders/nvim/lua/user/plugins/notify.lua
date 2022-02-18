local util = require("user.util")
local notify = util.require("notify")

vim.notify = notify

vim.notify.setup({
  -- Animation style (see below for details)
  stages = "fade",

  -- Default timeout for notifications
  timeout = 2000,

  -- Max number of columns for messages
  max_width = nil,
  -- Max number of lines for a message
  max_height = nil,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
  background_colour = "Normal",

  -- Minimum width for notification windows
  minimum_width = 50,
})
