local utils = require("user.utils")

utils.require_from("user.core.lsp.null-ls")({
  "formatters",
  "hovers",
  "linters",
  "code-actions",
})
