local functionalities = {
  "null-ls",
  "languages",
  "plugins",
}

for _, functionality in ipairs(functionalities) do
  reload("user.core.lsp." .. functionality)
end
