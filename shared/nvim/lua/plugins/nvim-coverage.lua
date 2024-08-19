local prefix = "<Leader>T"

---@type LazySpec
return {
  "andythigpen/nvim-coverage",
  dependencies = {
    {
      "AstroNvim/astrocore",
      optional = true,
      opts = function(_, opts)
        local utils = require "astrocore"

        if utils.is_available "coverage" then return end

        local maps = opts.mappings

        maps.n = utils.extend_tbl(maps.n or {}, {
          [prefix] = { desc = "󰗇 Tests" },
          [prefix .. "C"] = { desc = "Coverage" },
          [prefix .. "Cl"] = { function() require("coverage").load(true) end, desc = "Load and show coverage" },
          [prefix .. "Ct"] = { function() require("coverage").toggle() end, desc = "Toggle coverage" },
        })
      end,
    },
  },
}
