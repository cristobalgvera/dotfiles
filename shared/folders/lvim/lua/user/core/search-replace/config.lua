local M = {}

M.setup = function()
  local search_replace = reload("search-replace")
  search_replace.setup()
end

return M
