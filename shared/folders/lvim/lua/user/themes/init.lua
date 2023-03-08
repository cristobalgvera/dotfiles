local M = {}

reload("user.themes.keymaps")
local config = reload("user.themes.config")

M.toggle_theme = config.toggle_light_and_dark_theme

return M
