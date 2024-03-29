local M = {}

M.setup = function()
  local package_info = require("package-info")
  local shared = require("user.ftplugin.json.package-info.shared")

  package_info.setup({
    hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
    hide_unstable_versions = true, -- It hides unstable versions from version list e.g. `next-11.1.3-canary3`
    package_manager = "pnpm",
  })

  shared.set_highlights()
end

return M
