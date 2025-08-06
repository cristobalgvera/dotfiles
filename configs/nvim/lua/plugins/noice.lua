---@type LazySpec
return {
  "folke/noice.nvim",
  opts = function(_, opts)
    local utils = require "astrocore"

    local unwanted_notifications = {
      -- INFO: This is a workaround for the "No information available" message
      -- that appears when using the `:LspInfo` command and one of the LSPs
      -- does not provide any information.
      {
        event = "notify",
        message = "No information available",
      },
      -- INFO: Do not show deprecation messages for library functions
      -- that use `vim.tbl_islist` internally.
      {
        event = "msg_show",
        message = "vim.tbl_islist is deprecated",
      },
    }

    opts.routes = opts.routes or {}
    for _, notification in ipairs(unwanted_notifications) do
      utils.list_insert_unique(opts.routes, {
        {
          filter = {
            event = notification.event,
            find = notification.message,
          },
          opts = {
            skip = true,
          },
        },
      })
    end

    opts.presets = opts.presets or {}
    opts.presets.lsp_doc_border = true
  end,
}
