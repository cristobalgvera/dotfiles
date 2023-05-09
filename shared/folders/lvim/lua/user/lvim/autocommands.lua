local M = {}

M.setup = function()
  vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disable diagnostics on environment files",
    pattern = { ".env*" },
    callback = function(args)
      vim.diagnostic.disable(args.buf)
    end,
  })

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    desc = "Set spellcheck",
    command = [[
      setlocal spell
      setlocal spelllang=en_us,es_es
    ]],
  })
end

return M
