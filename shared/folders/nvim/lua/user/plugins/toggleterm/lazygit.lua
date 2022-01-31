local status_ok, toggleterm = pcall(require, "toggleterm.terminal")
if not status_ok then
  return
end

local terminal = toggleterm.Terminal
local lazygit = terminal:new({ cmd = "lazygit", hidden = true })

local util = require("user.util")
local keymap = util.keymap

function Toggle_lazygit()
  lazygit:toggle()
end

keymap("n", "<Leader>tg", "<cmd>lua Toggle_lazygit()<CR>")
