---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      n = {
        -- INFO: Conflict with `OpenCode` plugin mapping
        ["<Leader><Leader>"] = {
          function() require("oil").open() end,
          desc = "Open folder in Oil",
        },
      },
    },
  },
}
