require("user.core.lsp.null-ls.custom-sources")

local utils = require("user.utils")

utils.setup_from("user.core.lsp.null-ls")({
  "formatters",
  "linters",
  "code-actions",
  "keymaps",
  "install-sources",
})
