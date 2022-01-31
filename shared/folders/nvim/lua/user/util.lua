local M = {}

local default_opts = { noremap = true, silent = true }

M.keymap = function(mode, keybinding, command, opts)
	local global_keymap = vim.api.nvim_set_keymap
	local keymap_opts = opts or default_opts

	global_keymap(mode, keybinding, command, keymap_opts)
end

M.buf_keymap = function(bufnr, mode, keybinding, command, opts)
	local buffer_keymap = vim.api.nvim_buf_set_keymap
	local keymap_opts = opts or default_opts

	buffer_keymap(bufnr, mode, keybinding, command, keymap_opts)
end

M.is_windows = vim.fn.has("win32") == 1

M.Set = function(items)
	local set = {}

	for _, item in ipairs(items) do
		set[item] = true
	end

	return set
end

return M
