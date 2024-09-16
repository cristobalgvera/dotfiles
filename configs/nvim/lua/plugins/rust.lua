---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      if not opts.config then opts.config = {} end

      opts.config.rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
            },
          },
        },
      }
    end,
  },
}
