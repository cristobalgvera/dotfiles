vim.api.nvim_create_autocmd("LSPAttach", {
  desc = "Configure Neodim",
  callback = function()
    local neodim = reload("neodim")
    neodim.setup({
      alpha = 0.5,
      hide = {
        virtual_text = false,
        signs = false,
        underline = false,
      },
    })
  end,
})
