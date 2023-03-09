local M = {}

M.setup = function()
  vim.schedule(function()
    local copilot = reload("copilot")
    local copilot_cmp = reload("copilot_cmp")

    copilot.setup({
      plugin_manager_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/packer",
    })

    copilot_cmp.setup({
      formatters = {
        insert_text = require("copilot_cmp.format").remove_existing,
      },
    })
  end)
end

return M
