---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/neotest-jest" },
  opts = function(_, opts)
    if not opts.adapters then opts.adapters = {} end
    table.insert(opts.adapters, require "neotest-jest" {})
  end,
}
