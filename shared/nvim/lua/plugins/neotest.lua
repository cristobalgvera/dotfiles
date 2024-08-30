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
            [watch_prefix] = { desc = "Toggle Watch" },
            [watch_prefix .. "t"] = {
              function() require("neotest").watch.toggle() end,
              desc = "Watch test",
            },
            [watch_prefix .. "f"] = {
              function() require("neotest").watch.toggle(vim.fn.expand "%") end,
              desc = "Watch all test in file",
            },
            [watch_prefix .. "p"] = {
              function() require("neotest").watch.toggle(vim.fn.getcwd()) end,
              desc = "Watch all tests in project",
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
