local M = {}

-- HACK: Add highlight support after colorscheme change due to
-- the fact that the colorscheme is loaded after the plugin
local function fix_highlight()
  vim.api.nvim_create_autocmd("ColorScheme", {
    desc = "Add package-info highlight",
    callback = require("user.ftplugin.json.package-info.shared").set_highlights,
  })
end

M.setup = function()
  fix_highlight()
end

return M
