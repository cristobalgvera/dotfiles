local M = {}

M.setup = function()
  local utils = reload("user.utils")

  local os_shell = utils.is_windows and "pwsh --nologo" or vim.o.shell
  vim.o.shell = os_shell
end

return M
