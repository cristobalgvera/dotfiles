---@type LazySpec
return {
  "nvim-neotest/neotest",
  opts = function(_, opts)
    opts.adapters = {
      require "neotest-jest" {},
    }
  end,
}
