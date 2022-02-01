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

local nvim_gps = util.require("nvim-gps")
nvim_gps.setup()

lualine_setup.sections.lualine_c = {
	"filename",
	{ nvim_gps.get_location, cond = nvim_gps.is_available },
}

local colorscheme = util.require("user.plugins.colorscheme")
lualine_setup.options.theme = colorscheme or default_theme

lualine.setup(lualine_setup)
