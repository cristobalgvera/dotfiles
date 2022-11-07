local formatters = require_safe("lvim.lsp.null-ls.formatters")

formatters.setup({
  { command = "stylua", filetypes = { "lua" } }, -- cargo install stylua
})
