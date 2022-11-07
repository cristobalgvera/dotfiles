local plugins = {
  "null-ls",
}

for _, plugin in ipairs(plugins) do
  reload("user.core.lsp." .. plugin)
end
