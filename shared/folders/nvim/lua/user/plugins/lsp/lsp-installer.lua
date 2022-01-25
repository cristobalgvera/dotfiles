local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
  "gopls",
  "cssls",
  "html",
  "jsonls",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "rust_analyzer",
  "yamlls",
  "bashls", -- yarn global add bash-language-server
}

-- Install LSP servers if they're not already installed
for _, name in pairs(servers) do
    local config_ok, server = lsp_installer.get_server(name)
    -- Check that the server is supported in nvim-lsp-installer
    if config_ok then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local lsp_path = "user.plugins.lsp."
  local lsp_settings_path = lsp_path .. "settings."
  local opts = {
    on_attach = require(lsp_path .. "handlers").on_attach,
    capabilities = require(lsp_path .. "handlers").capabilities,
  }

  local custom_servers_config = {
    "jsonls",
    "html",
    "sumneko_lua",
    "yamlls",
  }

  for _, server_name in ipairs(custom_servers_config) do
    if server.name == server_name then
      local custom_opts = require(lsp_settings_path .. server_name)
      opts = vim.tbl_deep_extend("force", custom_opts, opts)
      break
    end
  end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
