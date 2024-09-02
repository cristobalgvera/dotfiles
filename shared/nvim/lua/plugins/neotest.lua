local test_prefix = "<Leader>T"
local watch_prefix = test_prefix .. "W"

---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [watch_prefix] = { desc = " Watch" },
            [watch_prefix .. "t"] = {
              function() require("neotest").watch.toggle() end,
              desc = "Toggle watch test",
            },
            [watch_prefix .. "f"] = {
              function() require("neotest").watch.toggle(vim.fn.expand "%") end,
              desc = "Toggle watch all test in file",
            },
            [watch_prefix .. "p"] = {
              function() require("neotest").watch.toggle(vim.fn.getcwd()) end,
              desc = "Toggle watch all tests in project",
            },
            [watch_prefix .. "S"] = {
              function()
                --- NOTE: The proper type of the argument is missing in the documentation
                ---@see https://github.com/nvim-neotest/neotest/blob/master/doc/neotest.txt#L626
                ---@diagnostic disable-next-line: missing-parameter
                require("neotest").watch.stop()
              end,
              desc = "Stop all watches",
            },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    opts.adapters = {
      require "neotest-jest" {},
    }
  end,
}
