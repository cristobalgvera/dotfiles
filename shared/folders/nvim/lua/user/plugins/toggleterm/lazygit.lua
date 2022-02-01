local util = require("user.util")
local toggleterm = util.require("toggleterm.terminal")

local terminal = toggleterm.Terminal
local lazygit = terminal:new({ cmd = "lazygit", hidden = true })

local keymap = util.keymap

_G.toggle_lazygit = function()
	lazygit:toggle()
end

keymap("n", "<Leader>tg", "<cmd>lua toggle_lazygit()<CR>")
