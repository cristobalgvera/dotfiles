local util = require("user.util")
local base_path = "user.plugins.nvim-dap."

local files = {
  "virtual-text",
  "dap-ui",
  -- "dap-install", -- disabled due unknown issues with git and npm in windows
}

for _, file in ipairs(files) do
  util.require(base_path .. file).setup()
end
