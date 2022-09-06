local util = require("user.util")
local lsp_installer = util.require("nvim-lsp-installer")

local servers = {
  "gopls", -- go install golang.org/x/tools/gopls@latest
  "cssls", -- yarn global add vscode-langservers-extracted
  "html", -- yarn global add vscode-langservers-extracted
  "eslint", -- yarn global add vscode-langservers-extracted
  "jsonls", -- yarn global add vscode-langservers-extracted
  "sumneko_lua", -- install Lua from VSCode (extension)
  "tailwindcss", -- yarn global add tailwindcss @tailwindcss/language-server
  "tsserver", -- yarn global add typescript typescript-language-server
  "rust_analyzer", -- rustup component add rust-src
  "yamlls", -- yarn global add yaml-language-server
  "bashls", -- yarn global add bash-language-server
  "emmet_ls", -- yarn global add emmet-ls
  "pyright", -- just needs python installed
  "angularls", -- yarn global add @angular/language-server
  "dockerls", -- yarn global add dockerfile-language-server-nodejs
  "terraformls", -- follow this instructions https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md
  "prismals", -- yarn global add @prisma/language-server
}

-- Install LSP servers if they're not already installed
for _, name in pairs(servers) do
  local config_ok, server = lsp_installer.get_server(name)
  -- Check that the server is supported in nvim-lsp-installer
  if config_ok then
    if not server:is_installed() then
      util.notify("LSP Installer", "Installing " .. name, vim.lsp.log_levels.INFO)
      server:install()
    end
  end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local lsp_path = "user.plugins.lsp."
  local lsp_settings_path = lsp_path .. "settings."
  local handlers = util.require(lsp_path .. "handlers")
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local custom_servers_config = util.Set({
    "html",
    "sumneko_lua",
    "yamlls",
    "jsonls",
    "cssls",
    "emmet_ls",
  })

  if custom_servers_config[server.name] then
    local custom_opts = util.require(lsp_settings_path .. server.name, {
      error_title = "LSP Installer",
      error_message = "Unable to load '" .. server.name .. "' server",
    })
    opts = vim.tbl_deep_extend("force", custom_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
