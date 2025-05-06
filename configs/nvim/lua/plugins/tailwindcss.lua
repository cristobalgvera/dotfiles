---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.config = opts.config or {}

      opts.config.tailwindcss = {
        settings = {
          ["tailwindCSS"] = {
            classFunctions = { "cva", "cx" },
          },
        },
      }
    end,
  },
}
