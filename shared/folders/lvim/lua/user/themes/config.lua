local M = {}

--- @enum THEME_TYPE
local THEME_TYPE = {
  DARK = 0,
  LIGHT = 1,
}

--- Set the theme
--- @param theme_type THEME_TYPE
local function set_theme(theme_type)
  local colorscheme = M.themes[theme_type]

  vim.api.nvim_command("colorscheme " .. colorscheme)
  lvim.colorscheme = colorscheme

  vim.notify("Colorscheme set to " .. colorscheme)
end

--- Managed themes
M.themes = {
  [THEME_TYPE.DARK] = "tokyonight-moon",
  [THEME_TYPE.LIGHT] = "catppuccin-latte",
}

M.default_theme = M.themes[THEME_TYPE.DARK]

M.toggle_light_and_dark_theme = function()
  local current_theme = lvim.colorscheme

  if current_theme == M.themes[THEME_TYPE.DARK] then
    set_theme(THEME_TYPE.LIGHT)
  elseif current_theme == M.themes[THEME_TYPE.LIGHT] then
    set_theme(THEME_TYPE.DARK)
  else
    set_theme(THEME_TYPE.DARK)
  end
end

lvim.colorscheme = M.default_theme

return M
