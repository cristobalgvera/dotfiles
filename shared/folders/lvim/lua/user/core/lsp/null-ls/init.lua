local utils = require("user.utils")

utils.setup_from("user.core.lsp.null-ls")({
  "formatters",
  "linters",
  "code-actions",
})
