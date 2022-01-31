local M = {}

M.setup = function(cmp)
	local status_ok, npairs = pcall(require, "nvim-autopairs")
	if not status_ok then
		return
	end

	local cmp_npairs_status_ok, cmp_npairs = pcall(require, "nvim-autopairs.completion.cmp")
	if cmp_npairs_status_ok then
		-- <M-e> to use fast_wrap
		npairs.setup({
			fast_wrap = {},
		})

		-- map <CR> to activate npairs
		cmp.event:on("confirm_done", cmp_npairs.on_confirm_done({ map_char = { tex = "" } }))
	end
end

return M
