---@type LazySpec
return {
  "folke/noice.nvim",
  opts = function(_, opts)
    if not opts.presets then opts.presets = {} end
    opts.presets.lsp_doc_border = true
  end,
}
