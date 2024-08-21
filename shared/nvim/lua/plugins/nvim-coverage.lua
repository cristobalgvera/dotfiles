local tests_prefix = "<Leader>T"
local coverage_prefix = tests_prefix .. "C"

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
          [tests_prefix] = { desc = "󰗇 Tests" },
          [coverage_prefix] = { desc = "Coverage" },
          [coverage_prefix .. "l"] = { function() require("coverage").load(true) end, desc = "Load and show coverage" },
          [coverage_prefix .. "t"] = { function() require("coverage").toggle() end, desc = "Toggle coverage" },
          [coverage_prefix .. "s"] = { function() require("coverage").summary() end, desc = "Show coverage summary" },
        })
      end,
    },
  },
}
