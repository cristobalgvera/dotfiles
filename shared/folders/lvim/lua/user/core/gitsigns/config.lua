local M = {}

M.setup = function()
  local gitsigns_opts = lvim.builtin.gitsigns.opts

  gitsigns_opts.current_line_blame = false
  gitsigns_opts.current_line_blame_opts.delay = 300

  -- Commit blame example: "ﰖ John Doe, 1 month ago • feat(gitsigns): add blame format"
  gitsigns_opts.current_line_blame_formatter = "ﰖ <author>, <author_time:%R> • <summary>"
end

return M
