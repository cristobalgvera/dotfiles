local M = {}

local utils = require("user.utils")

utils.require_from("user.core.themes")({
  "keymaps",
})

local config = require("user.core.themes.config")

M.toggle_theme = config.toggle_light_and_dark_theme

return M
