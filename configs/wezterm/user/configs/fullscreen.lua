local utils = require "user.utils"
local wezterm = utils.wezterm

---Maximize all displayed windows on startup
wezterm.on("gui-attached", function()
  local mux = wezterm.mux
  local workspace = mux.get_active_workspace()

  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then window:gui_window():toggle_fullscreen() end
  end
end)

---@type Config
---@diagnostic disable-next-line: missing-fields
return {
  native_macos_fullscreen_mode = true,
  keys = {
    {
      key = "f",
      mods = "SHIFT|CTRL",
      action = wezterm.action.ToggleFullScreen,
    },
  },
}
