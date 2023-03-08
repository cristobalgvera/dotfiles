local M = {}

M.setup = function()
  local coverage = reload("coverage")

  coverage.setup({
    auto_reload = true,
    auto_reload_timeout = 10 * 1000, -- Milliseconds to wait for reload coverage report
    summary = {
      min_coverage = 100,
    },
  })
end

return M
