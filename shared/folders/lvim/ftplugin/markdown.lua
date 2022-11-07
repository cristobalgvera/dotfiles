local config = require_safe("user.shared.ftplugin.default-config")

local mappings = {
  M = {
    name = "+Markdown",
    p = { "<cmd>MarkdownPreview<cr>", "Preview" },
    s = { "<cmd>MarkdownPreviewStop<cr>", "Stop" },
    t = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle" },
  },
}

config.setup(mappings)
