local utils = require("user.utils")

utils.require_from("user.core")({
  "alpha",
  "bufferline",
  "chat-gpt",
  "cmp",
  "dressing",
  "fidget",
  "highlight-colors",
  "hop",
  "gitsigns",
  "lsp",
  "neodim",
  "nvim-coverage",
  "noice",
  "notify",
  "search-replace",
  "surround",
  "telescope",
  "themes",
  "todo-comments",
  "trouble",
})

-- Configure Treesitter last to properly add extensions
utils.require_from("user.core")({
  "treesitter",
})
