local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local personal_shell = vim.fn.has("windows") and "pwsh --nologo" or vim.o.shell

toggleterm.setup {
  open_mapping = [[<F12>]],
  direction = "float",
  float_opts = {
    border = 'curved',
  },
  shell = personal_shell
}

require "user.toggleterm.lazygit"
