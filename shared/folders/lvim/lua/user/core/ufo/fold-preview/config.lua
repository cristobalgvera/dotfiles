local M = {}

M.setup = function()
  local fold_preview = reload("fold-preview")

  fold_preview.setup()
end

return M
