local utils_ok, utils = pcall(require, "user.utils")

if not utils_ok then
  vim.notify_once("Utils module not found", vim.log.levels.ERROR)
  return
end

local personal_shell = utils.is_windows and "pwsh --nologo" or vim.o.shell

vim.o.shell =  personal_shell
