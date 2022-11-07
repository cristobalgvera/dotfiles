local copilot = require_safe("copilot")
local copilot_cmp = require_safe("copilot_cmp")

vim.schedule(function()
  copilot.setup({
    plugin_manager_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/packer",
  })

  copilot_cmp.setup({
    formatters = {
      insert_text = require("copilot_cmp.format").remove_existing,
    },
  })
end)
