---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      width = 40,
      sections = {
        { padding = 0.5 },
        { section = "header", padding = 1 },
        { section = "keys", gap = 1, padding = 2 },
        { section = "startup" },
      },
      formats = {
        header = { "%s", align = "center", hl = "Keyword" },
        key = { "%s", align = "left", hl = "Comment" },
      },
      preset = {
        header = table.concat(require("user.utilities.headers").get_random_header(), "\n"),
        keys = function()
          local get_icon = require("astroui").get_icon

          return {
            { key = "f", action = "<Leader>ff", icon = get_icon("Search", 0, true), desc = "Find File  " },
            { key = "o", action = "<Leader>fo", icon = get_icon("DefaultFile", 0, true), desc = "Recents  " },
            { key = "w", action = "<Leader>fw", icon = get_icon("WordFile", 0, true), desc = "Find Word  " },
          }
        end,
      },
    },
  },
}
