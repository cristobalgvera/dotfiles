local M = {}

--- Obtain an iterator function to require
--- files from a given base path
--- @param base_mod string
M.require_from = function(base_mod)
  --- Iterate over a table of files names and require them
  --- @param file_names table<any, string>
  return function(file_names)
    local files = {}

    for _, file_name in ipairs(file_names) do
      files[file_name] = require(base_mod .. "." .. file_name)
    end

    return files
  end
end

--- Obtain an iterator function to setup
--- configuration files from a given base path
--- @param base_mod string
M.setup_from = function(base_mod)
  --- Iterate over a table of configuration
  --- files and setup them
  --- @param config_file_names table<any, string> Each file needs to have a `setup` function declared
  return function(config_file_names)
    local config = M.require_from(base_mod)(config_file_names)

    for file_name, file in pairs(config) do
      local is_configurable = type(file) == "table" and type(file.setup) == "function"

      if is_configurable then
        file.setup()
      else
        vim.notify(string.format("No setup function found in %s", base_mod .. "." .. file_name), "error")
      end
    end
  end
end

return M
