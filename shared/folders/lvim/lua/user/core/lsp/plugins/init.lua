local plugins = {
  "lsp-signature",
}

for _, plugin in ipairs(plugins) do
  reload("user.core.lsp.plugins." .. plugin)
end
