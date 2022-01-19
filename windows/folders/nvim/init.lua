require "user.plugins.impatient"

require "user.hosts"
require "user.options"
require "user.globals"
require "user.keymaps"
require "user.plugins"

local plugins = {
  "alpha",
  "colorscheme",
  "cmp",
  "lsp",
  "telescope",
  "treesitter",
  "hop",
  "gitsigns",
  "trouble",
  "bufferline",
  "nvim-comment",
  -- "neoscroll",
  "nvim-tree",
  "lualine",
  "session-manager",
  "toggleterm",
}

for _, plugin in ipairs(plugins) do
  require("user.plugins." .. plugin)
end
