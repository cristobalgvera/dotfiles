local M = {}

local function cspell_config_extension()
  return { disabled_filetypes = { "NvimTree", "alpha" } }
end

M.setup = function()
  local null_ls = reload("null-ls")
  local cspell = reload("cspell") -- npm install -g cspell @cspell/dict-es-es && cspell link add @cspell/dict-es-es

  null_ls.register({
    cspell.diagnostics.with(cspell_config_extension()),
    cspell.code_actions.with(cspell_config_extension()),
  })

  null_ls.disable({ name = "cspell" })
end

return M
