local M = {}

M.setup = function()
  local tabnine = reload("cmp_tabnine.config")

  tabnine.setup({
    max_lines = 1000,
    max_num_results = 3,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
    ignored_file_types = {},
    show_prediction_strength = false,
  })
end

return M
