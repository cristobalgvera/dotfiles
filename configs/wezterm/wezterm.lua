local utils = require "user.utils"
local wezterm = utils.wezterm

local configs = utils.require_from "user/configs"

return utils.merge_configurations {
  wezterm.config_builder(),
  table.unpack(configs),
}
