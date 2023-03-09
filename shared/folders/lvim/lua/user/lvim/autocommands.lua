local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disable diagnostics on environment files",
    pattern = { ".env*" },
    callback = function(args)
      vim.diagnostic.disable(args.buf)
    end,
  })
end

return M
