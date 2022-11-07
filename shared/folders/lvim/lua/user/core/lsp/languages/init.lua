local languages = {
  "node",
}

for _, language in ipairs(languages) do
  reload("user.core.lsp.languages." .. language)
end
