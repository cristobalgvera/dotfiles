local M = {}

-- This configuration is applied only when
-- the event occurs (a.k.a. lazy loaded)
M.setup = function()
  vim.api.nvim_create_autocmd("BufRead", {
    desc = "Configure Todo-Comments",
    callback = function()
      local todo_comments = reload("todo-comments")
      todo_comments.setup()
    end,
  })
end

return M
