local util = require("user.util")
local M = {}

local function configure_debuggers(dap_install)
  -- local dbg_list = util.require("dap-install.api.debuggers").get_installed_debuggers()
  -- for _, debugger in ipairs(dbg_list) do
  --   dap_install.config(debugger)
  -- end

  dap_install.config("chrome", {})
  dap_install.config("jsnode", {})
end

M.setup = function()
  local dap_install = util.require("dap-install")

  dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dap-install/",
  })

  configure_debuggers(dap_install)
end

return M
