---Notification shape to skip definition for Noice routes configuration.
---@class NotificationToSkip
---@field event string|"notify"|"msg_show" The event type of the notification to skip.
---@field kind? string|"echomsg"|"lua_error" The kind of notification to skip.
---@field message string The message content of the notification to skip. This can be a substring of

---Skip specific notifications from Noice based on event, kind, or message content.
---@param current_routes table The existing Noice routes to which the unwanted notifications will be added.
---@param notifications_to_skip NotificationToSkip[] A list of notifications to skip, each defined by its event, kind, and message.
---@return table new_routes The modified routes with the unwanted notifications set to be skipped.
local function skip_notifications(current_routes, notifications_to_skip)
  local utils = require "astrocore"

  local routes_with_skipped_notifications = current_routes or {}
  for _, notification in ipairs(notifications_to_skip) do
    routes_with_skipped_notifications = utils.list_insert_unique(routes_with_skipped_notifications, {
      {
        filter = {
          event = notification.event,
          kind = notification.kind,
          find = notification.message,
        },
        opts = {
          skip = true,
        },
      },
    })
  end

  return routes_with_skipped_notifications
end

---@type LazySpec
return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.presets = opts.presets or {}
    opts.presets.lsp_doc_border = true

    opts.routes = skip_notifications(opts.routes or {}, {
      -- INFO: Avoid annoying "No information available" messages
      -- when hovering over symbols without documentation.
      { event = "notify", message = "No information available" },
    })
  end,
}
