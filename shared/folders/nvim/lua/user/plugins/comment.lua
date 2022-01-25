local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup({
	pre_hook = function(context)
		local comment_utils = require("Comment.utils")

		local location = nil
		if context.ctype == comment_utils.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif context.cmotion == comment_utils.cmotion.v or context.cmotion == comment_utils.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = context.ctype == comment_utils.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})
