local M = {}

M.setup = function()
  local which_key = lvim.builtin.which_key

  which_key.mappings["v"] = {
    name = "+Coverage",
    d = { "<cmd>Coverage<cr>", "Display coverage" },
    t = { "<cmd>CoverageToggle<cr>", "Toggle coverage" },
    c = { "<cmd>CoverageClear<cr>", "Clear coverage" },
    s = { "<cmd>CoverageSummary<cr>", "Show summary" },
    j = {
      name = "+Jump",
      n = { "<cmd>lua require('coverage').jump_next('uncovered')<cr>", "Next uncovered" },
      p = { "<cmd>lua require('coverage').jump_prev('uncovered')<cr>", "Previous uncovered" },
    },
  }
end

return M
