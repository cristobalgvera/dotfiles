local close_buffers_status_ok, close_buffers = pcall(require, "close_buffers")
local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not (close_buffers_status_ok and bufferline_status_ok) then
	return
end

close_buffers.setup({
	preserve_window_layout = { "this" },
	next_buffer_cmd = function(windows)
		bufferline.cycle(1)
		local bufnr = vim.api.nvim_get_current_buf()

		for _, window in ipairs(windows) do
			vim.api.nvim_win_set_buf(window, bufnr)
		end
	end,
})
