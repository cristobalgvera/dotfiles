---@type LazySpec
return {
  "ravitemer/codecompanion-history.nvim",
  cmd = {
    "CodeCompanionHistory",
    "CodeCompanionSummaries",
  },
  specs = {
    {
      "olimorris/codecompanion.nvim",
      optional = true,
      opts = {
        extensions = {
          history = {},
        },
      },
    },
  },
}
