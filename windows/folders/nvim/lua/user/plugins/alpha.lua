local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
local button = dashboard.button

dashboard.section.header.val = {
  [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
  [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
  [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
  [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
  [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
  [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
}

dashboard.section.buttons.val = {
  button("e", "  New file" , "<cmd>ene <BAR> startinsert <CR>"),
  button("SPC f", "  Find file"),
  button("<C-s>", "  Find word"),
  button("q", "  Quit Neovim" , "<cmd>qa<CR>"),
}

dashboard.opts.opts.noautocmd = true

vim.cmd[[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]]

alpha.setup(dashboard.opts)
