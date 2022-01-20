local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

local lsp_path = "user.plugins.lsp."

require(lsp_path .. "lsp-installer")
require(lsp_path .. "handlers").setup()
require(lsp_path .. "null-ls")
