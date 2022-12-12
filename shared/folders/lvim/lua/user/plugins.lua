lvim.plugins = {
  -- Dressing
  "stevearc/dressing.nvim",

  -- Fidget
  "j-hui/fidget.nvim",

  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  },

  -- Hop
  "phaazon/hop.nvim",

  -- LspSignature
  "ray-x/lsp_signature.nvim",

  -- MarkdownPreview
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- Surround
  "kylechui/nvim-surround",

  -- TabNine
  {
    "tzachar/cmp-tabnine",
    after = "nvim-cmp",
    run = "./install.sh",
  },

  -- Themes
  "NTBBloodbath/doom-one.nvim",
  {
    "rose-pine/neovim",
    as = "rose-pine",
  },

  -- Treesitter
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-ts-autotag",
  "RRethy/nvim-treesitter-textsubjects",

  -- Trouble
  "folke/trouble.nvim",

  -- TypeScript
  "jose-elias-alvarez/typescript.nvim",

  -- Wakatime
  "wakatime/vim-wakatime",
}
