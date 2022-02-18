local util = require("user.util")
local toggleterm = util.require("toggleterm")

local personal_shell = util.is_windows and "pwsh --nologo" or vim.o.shell

toggleterm.setup({
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  shell = personal_shell,
})

util.require("user.plugins.toggleterm.lazygit")
