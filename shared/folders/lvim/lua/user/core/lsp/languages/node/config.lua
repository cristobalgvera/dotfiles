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

--- @param servers table<any, string>
local function setup_custom_servers(servers)
  local lsp_manager = require_safe("lvim.lsp.manager")
  lvim.lsp.installer.setup.ensure_installed = servers

  for _, server in pairs(servers) do
    lsp_manager.setup(server)
  end
end

M.setup = function()
  setup_typescript()
  setup_custom_servers({ "angularls" })
end

return M
