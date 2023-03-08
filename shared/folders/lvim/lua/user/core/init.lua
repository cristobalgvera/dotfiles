local plugins = {
  "alpha",
  "bufferline",
  "chat-gpt",
  "cmp",
  "dressing",
  "fidget",
  "hop",
  "gitsigns",
  "lsp",
  "noice",
  "notify",
  "nvim-coverage",
  "nvimtree",
  "surround",
  "telescope",
  "treesitter",
  "todo-comments",
  "trouble",
}

for _, plugin in ipairs(plugins) do
  reload("user.core." .. plugin)
end
