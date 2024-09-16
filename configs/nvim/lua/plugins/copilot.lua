---@type LazySpec
return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    opts.filetypes = require("astrocore").extend_tbl(opts.filetypes or {}, {
      yaml = true,
      markdown = true,
    })
  end,
}
