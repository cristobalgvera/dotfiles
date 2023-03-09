local M = {}

M.setup = function()
  local which_key = require("user.ftplugin.config.which-key")

  local mappings = {
    M = {
      name = "+Markdown",
      p = { "<cmd>MarkdownPreview<cr>", "Preview" },
      s = { "<cmd>MarkdownPreviewStop<cr>", "Stop" },
      t = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle" },
    },
  }

  which_key.setup(mappings)
end

return M
