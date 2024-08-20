---@type LazySpec
return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.presets.lsp_doc_border = true

    if not opts.lsp.signature then opts.lsp.signature = {} end
    opts.lsp.signature.enabled = false
  end,
}
