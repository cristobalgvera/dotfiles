---@type LazySpec
return {
  "iamcco/markdown-preview.nvim",
  build = function(plugin)
    -- HACK: Install using `npx` (using `yarn`) if available
    ---@see https://github.com/iamcco/markdown-preview.nvim/issues/690#issuecomment-2254280534
    if vim.fn.executable "npx" then
      vim.cmd("!cd " .. plugin.dir .. " && cd app && COREPACK_ENABLE_AUTO_PIN=0 npx -y yarn install --frozen-lockfile")
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn["mkdp#util#install"]()
    end
  end,
  ft = { "markdown", "markdown.mdx" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  init = function()
    local plugin = require("lazy.core.config").spec.plugins["markdown-preview.nvim"]
    vim.g.mkdp_filetypes = require("lazy.core.plugin").values(plugin, "ft", true)
  end,
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Markdown = "" } } },
    {
      "AstroNvim/astrocore",
      optional = true,
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>M"

        maps.n[prefix] = { desc = require("astroui").get_icon("Markdown", 1, true) .. "Markdown" }
        maps.n[prefix .. "p"] = { "<cmd>MarkdownPreview<cr>", desc = "Preview" }
        maps.n[prefix .. "s"] = { "<cmd>MarkdownPreviewStop<cr>", desc = "Stop preview" }
        maps.n[prefix .. "t"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle preview" }
      end,
    },
  },
}
