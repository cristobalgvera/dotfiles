local M = {}

--- @enum render
M.render = {
  DEFAULT = "default",
  MINIMAL = "minimal",
  SIMPLE = "simple",
  COMPACT = "compact",
}

--- @enum stages
M.stages = {
  FADE = "fade",
  FADE_IN_SLIDE_OUT = "fade_in_slide_out",
  SLIDE = "slide",
  STATIC = "static",
}

return M
