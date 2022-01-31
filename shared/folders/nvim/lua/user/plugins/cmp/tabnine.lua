local status_ok, tabnine = pcall(require, "cmp_tabnine.config")
if not status_ok then
	return
end

local M = {}

M.setup = function()
	tabnine:setup({
		max_lines = 1000,
		max_num_results = 3,
		sort = true,
		run_on_every_keystroke = true,
		snippet_placeholder = "..",
		ignored_file_types = {}, -- default is not to ignore
	})
end

return M
