---Validate that biome is being used in the project by checking for the presence of a biome configuration file.
---@param file_names string[] List of possible biome configuration file names to check for.
---@return boolean is_biome_in_use `true` if any of the specified biome configuration files are found in the project, `false` otherwise.
local function check_biome_usage_by_config_file(file_names)
  local project_rooter = require "astrocore.rooter"

  for _, file_name in ipairs(file_names) do
    if project_rooter.exists(file_name) then return true end
  end

  return false
end

---@type LazySpec
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    local is_biome_in_use = check_biome_usage_by_config_file {
      "biome.json",
      "biome.jsonc",
      ".biome.json",
      ".biome.jsonc",
    }

    if not is_biome_in_use then return end

    -- https://biomejs.dev/internals/language-support/
    local supported_biome_ft = {
      "css",
      "graphql",
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "typescript",
      "typescriptreact",
    }

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    for _, ft in ipairs(supported_biome_ft) do
      opts.formatters_by_ft[ft] = { "biome-check" }
    end
  end,
}
