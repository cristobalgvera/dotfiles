local plugins = {
  "treesitter",
}

for _, plugin in ipairs(plugins) do
  reload("user.core." .. plugin)
end
