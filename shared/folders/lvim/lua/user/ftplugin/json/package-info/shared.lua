local M = {}

M.set_highlights = function()
  vim.cmd([[
    hi PackageInfoUpToDateVersion guifg=#3c4048
    hi PackageInfoOutdatedVersion guifg=#d19a66
  ]])
end

return M
