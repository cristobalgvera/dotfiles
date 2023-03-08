local which_key = lvim.builtin.which_key

which_key.mappings[","] = {
  name = "+Themes",
  t = { "<cmd>lua require('user.themes').toggle_theme()<cr>", "Toggle light/dark theme" },
}
