---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts = opts or {}

      opts.formatters = opts.formatters or {}
      opts.formatters.oxfmt = vim.tbl_extend(
        "force",
        opts.formatters.oxfmt or {},
        { stdin = false, args = { "$FILENAME" } }
      )

      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      } do
        opts.formatters_by_ft[ft] = { "oxfmt", "prettierd", stop_after_first = true }
      end
    end,
  },
}
