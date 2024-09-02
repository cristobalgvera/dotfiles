---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings

        local watch_prefix = "<Leader>TW"

        maps.n[watch_prefix] = { desc = " Watch" }
        maps.n[watch_prefix .. "t"] = {
          function() require("neotest").watch.toggle() end,
          desc = "Toggle watch test",
        }
        maps.n[watch_prefix .. "f"] = {
          function() require("neotest").watch.toggle(vim.fn.expand "%") end,
          desc = "Toggle watch all test in file",
        }
        maps.n[watch_prefix .. "p"] = {
          function() require("neotest").watch.toggle(vim.fn.getcwd()) end,
          desc = "Toggle watch all tests in project",
        }
        maps.n[watch_prefix .. "S"] = {
          function()
            --- NOTE: The proper type of the argument is missing in the documentation
            ---@see https://github.com/nvim-neotest/neotest/blob/master/doc/neotest.txt#L626
            ---@diagnostic disable-next-line: missing-parameter
            require("neotest").watch.stop()
          end,
          desc = "Stop all watches",
        }
      end,
    },
  },
}
