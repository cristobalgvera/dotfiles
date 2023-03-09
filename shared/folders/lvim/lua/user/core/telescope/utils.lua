local M = {}

local extensions_to_load = {}

--- Add an extension to the list of extensions to load.
--- @param extension string The name of the extension to add.
M.add_extension = function(extension)
  extensions_to_load[#extensions_to_load + 1] = extension
end

--- Get the list of extensions to load.
M.get_extensions_to_load = function()
  return extensions_to_load
end

return M
