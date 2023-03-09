local M = {}

M.setup = function()
  lvim.builtin.telescope.on_config_done = function(telescope)
    local telescope_utils = require("user.core.telescope.utils")

    local extensions = telescope_utils.get_extensions_to_load()

    for _, extension in ipairs(extensions) do
      pcall(telescope.load_extension, extension)
    end
  end
end

return M
