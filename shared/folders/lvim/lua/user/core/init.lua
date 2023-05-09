local utils = require("user.utils")

utils.require_from("user.core")({
  "alpha",
  "bufferline",
  "cmp",
  "dressing",
  "highlight-colors",
  "hop",
  "gitsigns",
  "lsp",
  "neodim",
  "nvim-coverage",
  "noice",
  "search-replace",
  "scrollbar",
  "surround",
  "toggleterm",
  "treesitter",
  "themes",
  "todo-comments",
  "trouble",
  "ufo",
})

-- Configure Telescope last to properly add extensions
utils.require_from("user.core")({
  "telescope",
})
