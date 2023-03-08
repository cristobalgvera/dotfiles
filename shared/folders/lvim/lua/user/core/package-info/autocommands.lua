local M = {}

-- HACK: Add highlight support after colorscheme change due to
-- the fact that the colorscheme is loaded after the plugin
local function fix_highlight()
  vim.api.nvim_create_autocmd("ColorScheme", {
    desc = "Add package-info highlight",
    callback = function()
      vim.cmd([[
        hi PackageInfoUpToDateVersion guifg=#3c4048
        hi PackageInfoOutdatedVersion guifg=#d19a66
      ]])
    end,
  })
end

M.setup = function()
  fix_highlight()
end

return M
