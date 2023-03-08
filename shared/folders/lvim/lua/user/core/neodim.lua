vim.api.nvim_create_autocmd("LSPAttach", {
  desc = "Configure Neodim",
  callback = function()
    local neodim = reload("neodim")
    neodim.setup()
  end,
})
