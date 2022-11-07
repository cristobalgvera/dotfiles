local null_ls_builtins = {
  "formatters",
  "linters",
}

for _, builtin in ipairs(null_ls_builtins) do
  reload("user.core.lsp.null-ls." .. builtin)
end
