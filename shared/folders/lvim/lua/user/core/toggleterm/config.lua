local M = {}

M.setup = function()
  local toggleterm = reload("toggleterm.terminal")
  local Terminal = toggleterm.Terminal

  local lazydocker_terminal = Terminal:new({
    cmd = "lazydocker",
    direction = "tab",
  })

  local lazygit_terminal = Terminal:new({
    cmd = "lazygit",
    direction = "tab",
  })

  function _Lazydocker_toggle()
    lazydocker_terminal:toggle()
  end

  function _Lazygit_toggle()
    lazygit_terminal:toggle()
  end
end

return M
