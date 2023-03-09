local M = {}

M.setup = function()
  local dressing = reload("dressing")

  local TRANSPARENCY = 0 -- Window transparency (0-100)

  dressing.setup({
    input = {
      win_options = {
        winblend = TRANSPARENCY,
      },
    },

    select = {
      nui = {
        win_options = {
          winblend = TRANSPARENCY,
        },
      },

      builtin = {
        win_options = {
          winblend = TRANSPARENCY,
        },
      },
    },
  })
end

return M
