local nvimtree = lvim.builtin.nvimtree.setup

-- Hidden files and/or directories
local hidden_files = {}
nvimtree.filters.custom = vim.tbl_deep_extend("keep", nvimtree.filters.custom, hidden_files)
