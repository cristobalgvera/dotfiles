local M = {}

M.setup = function()
  local ufo = reload("ufo")

  ufo.setup({
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  })
end

return M
