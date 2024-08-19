---@type LazySpec
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function(plugin)
    -- HACK: Install using `npx` if available
    if vim.fn.executable "npx" then
      vim.cmd("!cd " .. plugin.dir .. " && cd app && COREPACK_ENABLE_AUTO_PIN=0 npx -y yarn install --frozen-lockfile")
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn["mkdp#util#install"]()
    end
  end,
  init = function()
    if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
  end,
}
