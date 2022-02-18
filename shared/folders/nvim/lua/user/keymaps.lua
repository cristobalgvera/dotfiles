local util = require("user.util")
local keymap = util.keymap
local plugmap = util.plugmap

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Better file management
keymap("n", "<Leader>w", ":w<CR>")

-- File manager
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>")
keymap("n", "<Leader>r", "<cmd>NvimTreeRefresh<CR>")

-- Telescope
keymap(
  "n",
  "<Leader>ff",
  ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>"
)
keymap("n", "<Leader>fw", "<cmd>Telescope live_grep<CR>")

-- Hop
keymap("n", "f", "<cmd>HopChar2<CR>")
keymap("n", "F", "<cmd>HopWord<CR>")

-- Trouble
keymap("n", "<Leader>xx", "<cmd>Trouble<CR>")
keymap("n", "<Leader>xwd", "<cmd>Trouble workspace_diagnostics<CR>")
keymap("n", "<Leader>xdd", "<cmd>Trouble document_diagnostics<CR>")
keymap("n", "<Leader>xl", "<cmd>Trouble loclist<CR>")
keymap("n", "<Leader>xq", "<cmd>Trouble quickfix<CR>")
keymap("n", "<Leader>xr", "<cmd>Trouble lsp_references<CR>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Focus
keymap("n", "<Leader>bft", "<cmd>FocusToggle<CR>")
keymap("n", "<Leader>bff", "<cmd>FocusMaxOrEqual<CR>")

-- Bufferline
keymap("n", "<Leader>bgp", "<cmd>BufferLinePick<CR>")
keymap("n", "<Leader>bcp", "<cmd>BufferLinePickClose<CR>")
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
keymap("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")
keymap("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")
keymap("n", "<C-[>", "<cmd>BufferLineMovePrev<CR>")
keymap("n", "<C-]>", "<cmd>BufferLineMoveNext<CR>")

-- Close Buffers
keymap("n", "<Leader>q", "<cmd>lua require('close_buffers').delete({type = 'this'})<CR>")
keymap("n", "<Leader>bct", "<cmd>lua require('close_buffers').delete({type = 'this'})<CR>")
keymap("n", "<Leader>bco", "<cmd>lua require('close_buffers').delete({type = 'other'})<CR>")
keymap("n", "<Leader>bch", "<cmd>lua require('close_buffers').delete({type = 'hidden'})<CR>")
keymap("n", "<Leader>bcu", "<cmd>lua require('close_buffers').delete({type = 'unnamed'})<CR>")
keymap("n", "<Leader>bca", "<cmd>lua require('close_buffers').delete({type = 'all'})<CR>")

-- ToggleTerm
keymap("n", "<Leader>tt", "<cmd>ToggleTerm<CR>")

-- Neogen
keymap("n", "<Leader>cg", "<cmd>lua require('neogen').generate()<CR>")

-- Debug
plugmap("n", "<Leader>dl", "<Plug>VimspectorStepInto")
plugmap("n", "<Leader>dh", "<Plug>VimspectorStepOut")
plugmap("n", "<Leader>dj", "<Plug>VimspectorStepOver")
plugmap("n", "<Leader>dg", "<Plug>VimspectorRunToCursor")
plugmap("n", "<Leader>db", "<Plug>VimspectorToggleBreakpoint")
plugmap("n", "<Leader>dt", "<Plug>VimspectorToggleConditionalBreakpoint")
plugmap("n", "<Leader>ds", "<Plug>VimspectorStop")
plugmap("n", "<Leader>dr", "<Plug>VimspectorRestart")
plugmap("n", "<Leader>dp", "<Plug>VimspectorPause")
plugmap("n", "<Leader>dc", "<Plug>VimspectorContinue")
plugmap("n", "<Leader>de", "<Plug>VimspectorBalloonEval")

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<S-h>", "<gv")
keymap("v", "<S-l>", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")
