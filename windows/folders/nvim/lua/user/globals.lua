local globals = {
  general = {
    transparent_background = true,              -- transparent background (Default: false)
    italic_comments = true,                     -- italic comments (Default: true)
    italic_keywords = true,                     -- italic keywords (Default: true)
  },

  tokyonight = {
    style = "storm",                            -- can be 'storm', 'night' or 'day'
    trasparent = true,                          -- disable setting the background color
  },

  blamer = {
    enabled = 1,
    delay = 500,
    prefix = " ﰖ ",
  },

  dashboard = {
    default_executive = "telescope",            -- use telescope as fzf
    disable_statusline = 1,
    custom_header = {
     '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
     '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
     '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
     '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
     '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
     '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    },
    custom_footer = {},
  }
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

