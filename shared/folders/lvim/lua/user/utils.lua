local M = {}

--- True if current OS is Windows,
--- false otherwise.
M.is_windows = vim.fn.has("win32") == 1

--- Obtain an iterator function to require
--- files from a given base path
--- @param base_mod string
M.require_from = function(base_mod)
  --- Iterate over a table of files names and require them
  --- @param file_names table<any, string>
  return function(file_names)
    for _, file_name in ipairs(file_names) do
      require(base_mod .. "." .. file_name)
    end
  end
end

return M
