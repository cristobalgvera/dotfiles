---@type LazySpec
return {
  "ravitemer/mcphub.nvim",
  opts = function(_, opts)
    opts.port = 37373
    opts.config = vim.fn.expand "~/.config/mcphub/servers.json"
  end,
}
