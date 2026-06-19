---@type LazySpec
return {
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
