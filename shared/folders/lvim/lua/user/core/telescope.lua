lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "noice")
  pcall(telescope.load_extension, "notify")
end
