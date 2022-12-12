local dressing = reload("dressing")

-- Window transparency (0-100)
local transparency = 0

dressing.setup({
  input = {
    win_options = {
      winblend = transparency,
    },
  },

  select = {
    nui = {
      win_options = {
        winblend = transparency,
      },
    },

    builtin = {
      win_options = {
        winblend = transparency,
      },
    },
  },
})
