local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp", -- add lsp diagnostics to buffer tab
		diagnostics_update_in_insert = true, -- update buffer tab diagnostics when insert
		diagnostics_indicator = function(count, level, diagnostics_dict) -- the way diagnostics will be show
			local indicator = " "
			for diagnostic, amount in pairs(diagnostics_dict) do
				local symbol = diagnostic == "error" and " " or (diagnostic == "warning" and " " or "")
				indicator = indicator .. amount .. symbol
			end
			return indicator
			-- local icon = level:match("error") and " " or " "
			-- return " " .. icon .. count
		end,
		right_mouse_command = "vertical sbuffer %d", -- vertical split buffer when right click it
		middle_mouse_command = "bdelete! %d", -- delete buffer when middle click it
		offsets = {
			{
				filetype = "NvimTree",
				text = "  File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})
