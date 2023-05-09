local M = {}

M.setup = function()
  local statuscol = reload("statuscol")
  local statuscol_builtin = reload("statuscol.builtin")

  statuscol.setup({
    relculright = true,
    segments = {
      { text = { statuscol_builtin.foldfunc }, click = "v:lua.ScFa" },
      { text = { "%s" }, click = "v:lua.ScSa" },
      {
        text = { statuscol_builtin.lnumfunc, " " },
        condition = { true, statuscol_builtin.not_empty },
        click = "v:lua.ScLa",
      },
    },
  })
end

return M
