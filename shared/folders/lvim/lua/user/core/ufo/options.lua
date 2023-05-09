local M = {}

M.setup = function()
  vim.o.foldcolumn = "1" -- If '0', foldcolumn will be hidden
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
end

return M
