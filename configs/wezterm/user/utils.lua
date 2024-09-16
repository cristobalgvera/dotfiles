local M = {}

---@type Wezterm
---@diagnostic disable-next-line: assign-type-mismatch
M.wezterm = require "wezterm"

---Merge multiple configurations into one
---@param configurations Config[] Configurations to merge
---@return Config config Merged configuration
M.merge_configurations = function(configurations)
  local merged_configuration = {}

  for _, configuration in ipairs(configurations) do
    for key, value in pairs(configuration) do
      if merged_configuration[key] then M.wezterm.log_error("Duplicate key found: " .. key) end

      merged_configuration[key] = value
    end
  end

  return merged_configuration
end

---Require all `lua` files in a directory
---@param directory String Directory to require files relative to `wezterm.config_dir`
---@return table filenames List of required files
M.require_from = function(directory)
  local filenames = {}
  local find_files_cmd = ("find '%s/%s' -maxdepth 1 -type f"):format(
    M.wezterm.config_dir,
    directory
  )
  local pfile = io.popen(find_files_cmd, "r")

  if not pfile then
    M.wezterm.log_error("Failed to open directory: " .. directory)
    return filenames
  end

  ---Convert the directory path to a require path
  ---E.g.: `path/to/file` -> `path.to.file`
  local require_path = directory:gsub("/", ".")

  for file_name in pfile:lines() do
    ---Extract the filename without the extension nor the path.
    ---E.g.: `/path/to/file/file-name.lua` -> `file-name`
    local config_to_require = file_name:match "([^/]+)%.lua$"

    if config_to_require then
      filenames[#filenames + 1] = require(require_path .. "." .. config_to_require)
    end
  end

  if #filenames == 0 then M.wezterm.log_error("No files found in: " .. directory) end

  pfile:close()
  return filenames
end

return M
