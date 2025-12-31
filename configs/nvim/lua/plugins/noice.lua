---@type LazySpec
return {
  "folke/noice.nvim",
  opts = function(_, opts)
    local utils = require "astrocore"

    opts.presets = opts.presets or {}
    opts.presets.lsp_doc_border = true
  end,
}
