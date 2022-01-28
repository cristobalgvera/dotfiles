local status_ok, toggleterm = pcall(require, "toggleterm.terminal")
if not status_ok then
  return
end

local terminal = toggleterm.Terminal
local lazygit = terminal:new({ cmd = "lazygit", hidden = true })

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

function Toggle_lazygit()
  lazygit:toggle()
end

keymap("n", "<Leader>tg", "<cmd>lua Toggle_lazygit()<CR>", opts)
