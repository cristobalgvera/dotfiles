local utils = require("user.utils")

utils.require_from("user.core")({
  "alpha",
  "bufferline",
  "cmp",
  "dressing",
  "fidget",
  "highlight-colors",
  "hop",
  "gitsigns",
  "lsp",
  "neodim",
  "nvim-coverage",
  -- "noice",
  "notify",
  "search-replace",
  "scrollbar",
  "surround",
  "toggleterm",
  "treesitter",
  "themes",
  "todo-comments",
  "trouble",
})

-- Configure Telescope last to properly add extensions
utils.require_from("user.core")({
  "telescope",
})
