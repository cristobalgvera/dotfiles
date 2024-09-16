---@type Config
---@diagnostic disable-next-line: missing-fields
return {
  font = require("user.utils").wezterm.font_with_fallback {
    "DankMono Nerd Font Mono",
    "IosevkaTerm Nerd Font Mono",
  },
  font_size = 26,
  line_height = 1.25,
}
