lvim.plugins = {
  -- ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

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

  -- Noice
  {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Nvim Notify
  "rcarriga/nvim-notify",

  -- Surround
  "kylechui/nvim-surround",

  -- TabNine
  {
    "tzachar/cmp-tabnine",
    after = "nvim-cmp",
    run = "./install.sh",
  },

  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufRead",
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
