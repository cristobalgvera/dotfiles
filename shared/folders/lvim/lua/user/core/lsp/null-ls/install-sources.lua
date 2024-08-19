local M = {}

M.setup = function()
  local mason_null_ls = reload("mason-null-ls")

  mason_null_ls.setup({
    ensure_installed = {
      "typescript_language_server",
      "angular-language-server",
      "eslint_d@13.1.2", -- NOTE: This version has no issues with legacy non-flat config
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
