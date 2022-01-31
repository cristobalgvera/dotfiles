local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local util = require("user.util")
local personal_shell = util.is_windows and "pwsh --nologo" or vim.o.shell

toggleterm.setup {
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  shell = personal_shell
}

require "user.plugins.toggleterm.lazygit"
