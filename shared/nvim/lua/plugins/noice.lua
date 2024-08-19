---@type LazySpec
return {
  "folke/noice.nvim",
  opts = function(_, opts)
    local utils = require "astrocore"

    return utils.extend_tbl(opts or {}, {
      presets = utils.extend_tbl(opts.presets or {}, {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      }),
    })
  end,
}
