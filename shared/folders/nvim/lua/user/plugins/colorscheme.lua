local util = require("user.util")
local colorscheme = "tokyonight"

local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if status_ok then
	return colorscheme
end

util.notify("Colorscheme", "Colorscheme '" .. colorscheme .. "' was not found!")
