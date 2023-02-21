lvim.builtin.telescope.on_config_done = function(telescope)
  local extensions_to_load = {
    "noice",
    "notify",
    "todo-comments",
  }

  for _, extension in ipairs(extensions_to_load) do
    pcall(telescope.load_extension, extension)
  end
end
