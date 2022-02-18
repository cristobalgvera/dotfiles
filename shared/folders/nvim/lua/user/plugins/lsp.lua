local util = require("user.util")
util.require("lspconfig")

local lsp_path = "user.plugins.lsp."

util.require(lsp_path .. "lsp-installer")
util.require(lsp_path .. "handlers").setup()
util.require(lsp_path .. "null-ls")
util.require(lsp_path .. "rust-tools")

vim.cmd([[
  augroup LspFormatting
    autocmd! * *.lua
    autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)
  augroup END
]])
