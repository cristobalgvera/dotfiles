local globals = {
  general = {
    transparent_background = true, -- transparent background (Default: false)
    italic_comments = true, -- italic comments (Default: true)
    italic_keywords = true, -- italic keywords (Default: true)
  },

  tokyonight = {
    style = "storm", -- can be 'storm', 'night' or 'day'
    trasparent = true, -- disable setting the background color
    italic_keywords = false, -- disable italic in keywords
  },

  vimspector = {
    install_gadgets = { "vscode-node-debug2", "debugger-for-chrome" },
    enable_mappings = "HUMAN",
  },

  navic = {
    silence = true,
  },
}

-- Set each entry in globals variable
for category, options in pairs(globals) do
  for option, value in pairs(options) do
    if category == "general" then
      vim.g[option] = value
      return
    end

    local full_option = category .. "_" .. option
    vim.g[full_option] = value
  end
end
