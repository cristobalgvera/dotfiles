local util = require("user.util")
local lualine = util.require("lualine")

local default_theme = "auto"

local lualine_setup = {
  options = {
    theme = default_theme,
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}

local navic = util.require("nvim-navic")

lualine_setup.sections.lualine_c = {
  "filename",
  { navic.get_location, cond = navic.is_available },
}

local colorscheme = util.require("user.plugins.colorscheme")
lualine_setup.options.theme = colorscheme or default_theme

lualine.setup(lualine_setup)
