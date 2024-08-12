local M = {}

M.setup = function()
  local code_actions = reload("lvim.lsp.null-ls.code_actions")

  code_actions.setup({
    { command = "shellcheck" },
    { command = "eslint_d" },
  })
end

return M
