local M = {}

local function cspell_config_extension()
  return { disabled_filetypes = { "NvimTree", "alpha" } }
end

local function enable_spell()
  local null_ls = require("null-ls")

  vim.cmd([[
      setlocal spell
      setlocal spelllang=en_us,es_es
  ]])
  null_ls.enable({ name = "cspell" })
end

local function disable_spell()
  local null_ls = require("null-ls")

  vim.cmd("setlocal nospell")
  null_ls.disable({ name = "cspell" })
end

function Toggle_spell()
  -- It can be `spell` or `nospell`
  local current_spell = vim.api.nvim_cmd({
    cmd = "set",
    args = { "spell?" },
  }, { output = true })

  if current_spell:find("nospell", 1, true) then
    enable_spell()
  else
    disable_spell()
  end
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
