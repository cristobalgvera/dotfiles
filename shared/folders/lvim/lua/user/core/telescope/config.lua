local M = {}

M.setup = function()
  local defaults = lvim.builtin.telescope.defaults

  defaults.sorting_strategy = "ascending"
  defaults.layout_strategy = "flex"
  defaults.layout_config = {
    prompt_position = "top",
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.5,
    },
    vertical = {
      mirror = true,
      preview_cutoff = 0.4,
    },
    flip_columns = 96,
    height = 0.94,
    width = 0.86,
  }

  lvim.builtin.telescope.on_config_done = function(telescope)
    local telescope_utils = require("user.core.telescope.utils")

    local extensions = telescope_utils.get_extensions_to_load()

    for _, extension in ipairs(extensions) do
      pcall(telescope.load_extension, extension)
    end
  end
end

return M
