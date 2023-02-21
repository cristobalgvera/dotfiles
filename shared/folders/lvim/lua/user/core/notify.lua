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
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = vim.log.levels.WARN,
  minimum_width = 50,
  -- max_width = 60,
  -- max_height = 20,
  render = render.DEFAULT,
  stages = stages.FADE,
  timeout = 3000,
  top_down = true,
})
