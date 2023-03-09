local M = {}

local files = require("user.utils.files")
local os = require("user.utils.os")

M.require_from = files.require_from
M.setup_from = files.setup_from
M.is_windows = os.is_windows

return M
