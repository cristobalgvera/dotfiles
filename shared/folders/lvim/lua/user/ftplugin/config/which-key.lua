local M = {}

local which_key = reload("which-key")

M.options = lvim.builtin.which_key.opts

local function register(mappings, options)
  which_key.register(mappings, options)
end

M.setup_default = function(default_mappings, default_options)
  local _default_options = default_options or M.options

  return function(mappings, options)
    local _mappings = mappings or default_mappings
    local _options = options or _default_options

    register(_mappings, _options)
  end
end

M.setup = function(mappings, options)
  local _mappings = mappings or {}
  local _options = options or M.options

  register(_mappings, _options)
end

return M
