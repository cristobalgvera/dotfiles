-- TODO: Include hovers from LunarVim when it's available
local hovers = reload("user.util.null-ls.hovers")

hovers.setup({
  { command = "printenv" },
})
