local features = {
  "null-ls",
  "languages",
  "plugins",
}

for _, feature in ipairs(features) do
  reload("user.core.lsp." .. feature)
end
