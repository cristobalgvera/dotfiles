local notify = reload("notify")

local render = {
  DEFAULT = "default",
  MINIMAL = "minimal",
  SIMPLE = "simple",
  COMPACT = "compact",
}

local stages = {
  FADE = "fade",
  FADE_IN_SLIDE_OUT = "fade_in_slide_out",
  SLIDE = "slide",
  STATIC = "static",
}

notify.setup({
  icons = {
    TRACE = "✎",
    DEBUG = "",
    INFO = "",
    WARN = "",
    ERROR = "",
  },
  level = vim.log.levels.INFO,
  minimum_width = 50,
  max_width = 60,
  -- max_height = 20,
  render = render.DEFAULT,
  stages = stages.FADE,
  timeout = 3000,
  top_down = true,
  on_open = function(win)
    vim.api.nvim_win_set_option(win, "wrap", true)
  end,
})
