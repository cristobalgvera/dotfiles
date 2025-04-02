---@type LazySpec
return {
  "yetone/avante.nvim",
  opts = function(_, opts)
    if not opts.behavior then opts.behavior = {} end
    opts.behavior.enable_cursor_planning_mode = true
  end,
}
