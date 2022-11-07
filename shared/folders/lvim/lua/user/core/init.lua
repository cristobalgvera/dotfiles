local plugins = {
  "alpha",
  "cmp",
  "fidget",
  "hop",
  "gitsigns",
  "lsp",
  "nvimtree",
  "treesitter",
  "which-key",
}

for _, plugin in ipairs(plugins) do
  reload("user.core." .. plugin)
end
