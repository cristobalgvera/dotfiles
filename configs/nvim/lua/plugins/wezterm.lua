---@type LazySpec
return {
  "folke/lazydev.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.library, {
      { path = "wezterm-types", mods = { "wezterm" } },
    })
  end,
  dependencies = {
    { "justinsgithub/wezterm-types", lazy = true },
  },
}
