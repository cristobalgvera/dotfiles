local M = {}

M.setup = function()
  local notify = reload("notify")
  local notify_utils = require("user.core.notify.utils")

  local render = notify_utils.render
  local stages = notify_utils.stages

  notify.setup({
    icons = {
      TRACE = "✎",
      DEBUG = "",
      INFO = "",
      WARN = "",
      ERROR = "",
    },
    level = vim.log.levels.WARN,
    minimum_width = 50,
    max_width = 60,
    render = render.DEFAULT,
    stages = stages.FADE,
    timeout = 3000,
    top_down = true,
    on_open = function(win)
      vim.api.nvim_win_set_option(win, "wrap", true)
    end,
  })
end

return M
