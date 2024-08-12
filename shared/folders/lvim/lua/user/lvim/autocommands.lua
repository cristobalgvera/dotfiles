local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disable diagnostics on environment files",
    pattern = { ".env*" },
    callback = function(args)
      vim.diagnostic.enable(false, args.buf)
    end,
  })
end

return M
