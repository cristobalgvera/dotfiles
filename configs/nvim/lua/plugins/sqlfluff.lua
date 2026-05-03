---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.treesitter = opts.treesitter or {}

      opts.treesitter.ensure_installed =
        require("astrocore").list_insert_unique(opts.treesitter.ensure_installed, { "sql" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sqlfluff" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      local dialect = "postgres"

      if null_ls.is_registered "sqlfluff" then null_ls.deregister "sqlfluff" end

      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        null_ls.builtins.formatting.sqlfluff.with {
          extra_args = { "--dialect", dialect },
        },
        null_ls.builtins.diagnostics.sqlfluff.with {
          extra_args = { "--dialect", dialect },
        },
      })
    end,
  },
}
