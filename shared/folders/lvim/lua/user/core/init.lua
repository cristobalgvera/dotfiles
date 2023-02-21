local plugins = {
  "alpha",
  "bufferline",
  "cmp",
  "dressing",
  "fidget",
  "hop",
  "gitsigns",
  "lsp",
  "notify",
  "nvimtree",
  "surround",
  "telescope",
  "treesitter",
  "which-key",
}

for _, plugin in ipairs(plugins) do
  reload("user.core." .. plugin)
end
