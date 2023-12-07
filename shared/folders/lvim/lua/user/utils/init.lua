local M = {}

local files = require("user.utils.files")
local os = require("user.utils.os")
local constants = require("user.utils.constants")

M.require_from = files.require_from
M.setup_from = files.setup_from
M.is_windows = os.is_windows
M.constants = constants

return M
