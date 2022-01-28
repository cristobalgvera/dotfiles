local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better file management
keymap("n", "<Leader>w", ":w<CR>", opts)

-- File manager
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>r", "<cmd>NvimTreeRefresh<CR>", opts)

-- Telescope
keymap("n", "<Leader>ff", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
keymap("n", "<Leader>fw", "<cmd>Telescope live_grep<CR>", opts)

-- Hop
keymap("n", "f", "<cmd>HopChar2<CR>", opts)
keymap("n", "F", "<cmd>HopWord<CR>", opts)

-- Trouble
keymap("n", "<Leader>xx", "<cmd>Trouble<CR>", opts)
keymap("n", "<Leader>xwd", "<cmd>Trouble workspace_diagnostics<CR>", opts)
keymap("n", "<Leader>xdd", "<cmd>Trouble document_diagnostics<CR>", opts)
keymap("n", "<Leader>xl", "<cmd>Trouble loclist<CR>", opts)
keymap("n", "<Leader>xq", "<cmd>Trouble quickfix<CR>", opts)
keymap("n", "<Leader>xr", "<cmd>Trouble lsp_references<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Bufferline
keymap("n", "<Leader>bgp", "<cmd>BufferLinePick<CR>", opts)
keymap("n", "<Leader>bcp", "<cmd>BufferLinePickClose<CR>", opts)
keymap("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-[>", "<cmd>BufferLineMovePrev<CR>", opts)
keymap("n", "<C-]>", "<cmd>BufferLineMoveNext<CR>", opts)

-- Close Buffers
keymap("n", "<Leader>q", "<cmd>lua require('close_buffers').delete({type = 'this'})<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>bct", "<cmd>lua require('close_buffers').delete({type = 'this'})<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>bco", "<cmd>lua require('close_buffers').delete({type = 'other'})<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>bch", "<cmd>lua require('close_buffers').delete({type = 'hidden'})<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>bcu", "<cmd>lua require('close_buffers').delete({type = 'unnamed'})<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>bca", "<cmd>lua require('close_buffers').delete({type = 'all'})<CR>", { noremap = true, silent = true })

-- ToggleTerm
keymap("n", "<Leader>t", "<cmd>ToggleTerm<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<S-h>", "<gv", opts)
keymap("v", "<S-l>", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
