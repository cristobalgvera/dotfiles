local gitsigns_opts = lvim.builtin.gitsigns.opts
local gitsigns_utils = require("user.core.gitsigns.utils")

gitsigns_opts.current_line_blame = false
gitsigns_opts.current_line_blame_opts.delay = 300

gitsigns_opts.current_line_blame_formatter_opts.relative_time = true
gitsigns_opts.current_line_blame_formatter = gitsigns_utils.format_current_line_blame
