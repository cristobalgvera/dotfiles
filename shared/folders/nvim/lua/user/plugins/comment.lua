local util = require("user.util")
local comment = util.require("Comment")

comment.setup({
	pre_hook = function(context)
		local opts = {
			error_message = "Error while executing Comment pre-hook",
			error_level = vim.lsp.log_levels.ERROR,
		}

		local comment_utils = util.require("Comment.utils", opts)
		local ts_context_utils = util.require("ts_context_commentstring.utils", opts)
		local ts_context_internal = util.require("ts_context_commentstring.internal", opts)

		local location = nil
		if context.ctype == comment_utils.ctype.block then
			location = ts_context_utils.get_cursor_location()
		elseif context.cmotion == comment_utils.cmotion.v or context.cmotion == comment_utils.cmotion.V then
			location = ts_context_utils.get_visual_start_location()
		end

		return ts_context_internal.calculate_commentstring({
			key = context.ctype == comment_utils.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})
