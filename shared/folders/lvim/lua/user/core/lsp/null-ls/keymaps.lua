local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key
  local utils = require("user.utils")

  which_key.mappings["l"]["t"] = {
    name = "Toggle",
    s = { "<cmd>lua Toggle_spell()<cr>", "CSpell" },
  }

  which_key.mappings["l"]["f"] = {
    function()
      require("lvim.lsp.utils").format({
        timeout_ms = utils.constants.FORMAT_TIMEOUT,
      })
    end,
    "Format",
  }
end

return M
