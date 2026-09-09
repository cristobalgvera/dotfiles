---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(
        opts.adapters,
        require "neotest-vitest" {
          filter_fir = function(name) return name ~= "node_modules" end,
        }
      )
    end,
  },
}
