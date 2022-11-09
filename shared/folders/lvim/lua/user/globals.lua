local utils = reload("user.utils")

local personal_shell = utils.is_windows and "pwsh --nologo" or vim.o.shell

vim.o.shell = personal_shell
