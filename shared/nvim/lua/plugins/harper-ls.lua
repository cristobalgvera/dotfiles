---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "harper-ls" })
    end,
    dependencies = {
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable-next-line: missing-fields
          config = {
            harper_ls = {
              settings = {
                ["harper-ls"] = {
                  codeActions = {
                    forceStable = true,
                  },
                  linters = {
                    linking_verbs = true,
                  },
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "harper-ls" })
    end,
  },
}
