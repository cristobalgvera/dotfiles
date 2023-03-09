local M = {}

M.setup = function()
  lvim.plugins = {
    -- Catppuccin (Theme)
    { "catppuccin/nvim", as = "catppuccin" },

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

    -- Neodim
    "zbirenbaum/neodim",

    -- Noice
    {
      "folke/noice.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
    },

    -- Nvim Coverage
    {
      "andythigpen/nvim-coverage",
      requires = "nvim-lua/plenary.nvim",
    },

    -- Nvim Highlight Colors
    "brenoprata10/nvim-highlight-colors",

    -- Nvim Notify
    "rcarriga/nvim-notify",

    -- Nvim Numbertoggle
    "sitiom/nvim-numbertoggle",

    -- Package Info
    {
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
    },

    -- Search Replace
    "roobert/search-replace.nvim",

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
end

return M
