local null_ls_builtins = {
  "formatters",
  "hovers",
  "linters",
  "code-actions",
}

for _, builtin in ipairs(null_ls_builtins) do
  reload("user.core.lsp.null-ls." .. builtin)
end
