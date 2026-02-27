---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      if not opts.config then opts.config = {} end

      opts.config.angularls = {
        root_dir = function(fname) return require("lspconfig.util").root_pattern("angular.json", "nx.json")(fname) end,
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        htmlangular = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
