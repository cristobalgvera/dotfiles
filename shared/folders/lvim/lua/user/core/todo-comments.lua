vim.api.nvim_create_autocmd("BufRead", {
  desc = "Configure Todo-Comments",
  callback = function()
    local todo_comments = reload("todo-comments")
    todo_comments.setup()
  end,
})
