local M = {}

M.is_windows = vim.fn.has("win32") == 1

M.Set = function (items)
  local set = {}

  for _, item in ipairs(items) do
    set[item] = true
  end

  return set
end

return M
