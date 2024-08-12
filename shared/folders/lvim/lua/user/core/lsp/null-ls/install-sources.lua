local M = {}

M.setup = function()
  local mason_null_ls = reload("mason-null-ls")

  mason_null_ls.setup({
    ensure_installed = {
      "eslint_d",
      "prettierd",
      "markdownlint",
      "sqlfluff",
      "shellharden",
      "shellcheck",
      "stylua",
      "cspell",
    },
  })
end

return M
