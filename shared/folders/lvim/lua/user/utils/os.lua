local M = {}

--- True if current OS is Windows, false otherwise.
M.is_windows = vim.fn.has("win32") == 1

return M
