local M = {}

local function setup_typescript()
  local lsp = require_safe("lvim.lsp")
  local typescript = require_safe("typescript")

  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

  typescript.setup({
    -- disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
      fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
      on_attach = lsp.common_on_attach,
      on_init = lsp.common_on_init,
      capabilities = lsp.common_capabilities(),
    },
  })
end

--- @param servers_with_options table<any, [string, table]>]>
local function setup_custom_servers(servers_with_options)
  local lsp_manager = require_safe("lvim.lsp.manager")
  local servers = {}

  for _, server_with_options in pairs(servers_with_options) do
    local server = server_with_options[1]
    local options = server_with_options[2] or {}

    table.insert(servers, server)
    lsp_manager.setup(server, options)
  end

  lvim.lsp.installer.setup.ensure_installed = servers
end

M.setup = function()
  setup_typescript()
  setup_custom_servers({
    { "angularls" },
    { "tailwindcss" },
    { "html" },
    { "cssls" },
    { "emmet_ls" },
  })
end

return M
