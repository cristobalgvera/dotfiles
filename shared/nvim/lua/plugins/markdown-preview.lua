---@type LazySpec
return {
  "iamcco/markdown-preview.nvim",
  build = function(plugin)
    -- HACK: Use `yarn` when possible, or fallback to default install command
    ---@see https://github.com/iamcco/markdown-preview.nvim/issues/690#issuecomment-2254280534
    local package_manager = vim.fn.executable "yarn" and "yarn" or vim.fn.executable "npx" and "npx -y yarn" or false

    if package_manager then
      local cmd = string.format(
        "!cd %s && cd app && COREPACK_ENABLE_AUTO_PIN=0 %s install --frozen-lockfile",
        plugin.dir,
        package_manager
      )

      vim.cmd(cmd)
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn["mkdp#util#install"]()
    end
  end,
}
