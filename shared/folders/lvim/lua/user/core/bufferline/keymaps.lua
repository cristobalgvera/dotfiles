local M = {}

M.setup = function()
  -- Buffer cycling
  lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<TAB>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
  lvim.keys.normal_mode["<S-TAB>"] = ":BufferLineCyclePrev<CR>"
end

return M
