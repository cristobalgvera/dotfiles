local themes = {}

for _, theme in ipairs(themes) do
  reload("user.core.themes." .. theme)
end

local theme = "tokyonight-moon"

lvim.colorscheme = theme
