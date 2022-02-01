local util = require("user.util")
local toggleterm = util.require("toggleterm.terminal")

local terminal = toggleterm.Terminal
local lazygit = terminal:new({ cmd = "lazygit", hidden = true })

local keymap = util.keymap

function Toggle_lazygit()
	lazygit:toggle()
end

keymap("n", "<Leader>tg", "<cmd>lua Toggle_lazygit()<CR>")
