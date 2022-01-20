local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local default_theme = "auto"

local lualine_setup = {
  options = {
    theme = default_theme,
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

local nvim_gps_status_ok, nvim_gps = pcall(require, "nvim-gps")
if nvim_gps_status_ok then
  nvim_gps.setup()

  lualine_setup.sections.lualine_c = {
    'filename',
    { nvim_gps.get_location, cond = nvim_gps.is_available },
  }
end

local colorscheme_status_ok, colorscheme = pcall(require, "user.colorscheme")
if colorscheme_status_ok then
  lualine_setup.options.theme = colorscheme or default_theme
end

lualine.setup(lualine_setup)
