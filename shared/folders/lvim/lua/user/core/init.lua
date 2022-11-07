local plugins = {
  "alpha",
  "gitsigns",
  "nvimtree",
  "treesitter",
  "which_key",
}

for _, plugin in ipairs(plugins) do
  reload("user.core." .. plugin)
end
