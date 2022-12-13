-- TODO: Include hovers from LunarVim when it's available
local hovers = reload("user.util.null-ls.hover")

hovers.setup({
  { command = "printenv" },
})
